'use strict'

var contents = '';

console.log('this is a slideshow');
console.log(marked('# test\nof *marked*'));

function splitContents(text) {
    // split the slides apart
    var slides = text.split('\n#');

    // handle the special cases of starting with a newline or whitespace
    if (text.startsWith('\n'))
        slides = slides.slice(1);
    else
        slides[0] = slides[0].slice(1);

    // add the # character back to the start of each bit of text
    for (let i in slides) 
        slides[i] = '#'.concat(slides[i]);
    return slides;
}

function addParentSection(slides) {
    var prev = '';
    var result = [];
    for (let i in slides) {
        if (slides[i].startsWith('##'))
            result[i] = prev.concat('\n', slides[i]);
        else {
            prev = slides[i].split('\n')[0].slice(1).trim();
            result[i] = slides[i];
        }
    }
   return result;
}

function makeSlideElements(text, addParent) {
    var slides = splitContents(text);
    if (addParent)
        slides = addParentSection(slides);
    var elms = [];
    for (let i in slides) {
        let elm = document.createElement('section');
        elm.innerHTML = marked(slides[i]);
        elm.classList.add('slide');
        let heading = elm.getElementsByTagName('h1')[0] ||
                  elm.getElementsByTagName('h2')[0];
        heading.id = `slide-title-${i}`
        elms.push(elm);
    }
    return elms;
}

var cElm, nElm;
function startSlides(contentElm, navElm, url) {
    cElm = contentElm;
    nElm = navElm;

    var xlr = new XMLHttpRequest();
    xlr.open('GET', url, true);
    xlr.send();
    xlr.addEventListener('readystatechange', function() {
        contents = this.responseText;
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            window.setTimeout(setup.bind(this, contentElm, navElm), 1000);
        }
    });
    
    function setup(contentElm, navElm) {
        renderContents(contentElm, this.responseText);
        genNavbar(navElm, contentElm);
        // This sets the hash in the url
        var h = location.hash;
        if (h === '')
            selectSlide(cElm.children[0]);
        else {
            let slideIndex = parseInt(h.slice(1)) - 1;
            selectSlide(cElm.children[slideIndex]);
        }
    }

    function renderContents(rootElm, contents) {
        rootElm.innerHTML = '';
        for (let elm of makeSlideElements(contents, true))
            rootElm.appendChild(elm);
        rootElm.children[0].classList.add('shown');
    }

    // Handle the hotkeys for switching slides
    window.addEventListener('keyup', function(keyEvent) {
        switch(keyEvent.key) {
            case 'h':
            case 'ArrowLeft':
                prevSlide();
                break;
            case 'l':
            case ' ':
            case 'ArrowRight':
                nextSlide();
                break;
            case 'j':
            case 'ArrowDown':
                selectSlide(cElm.lastElementChild);
                break;
            case 'k':
            case 'ArrowUp':
                selectSlide(cElm.firstElementChild);
                break;
        }
    })
    // Handle hotkeys for changing the layout
    // notice that the event listeners are both run
    window.addEventListener('keyup', function(keyEvent) {
        switch(keyEvent.key) {
            case 's':
                toggleShowAll(cElm);
                break;
            case 'v':
                toggleHorizontal(cElm);
        }
    })

    // This handles the user changing the hash on the url
    window.onpopstate = function () {
        var slideIndex = location.hash.slice(1)-1;
        selectSlide(cElm.children[slideIndex]);
    }

}

function toggleShowAll(cElm) {
    cElm.classList.toggle('show-all');
}

function toggleHorizontal(cElm) {
    cElm.classList.toggle('horizontal');
}

function prevSlide() {
    var current = cElm.getElementsByClassName('shown')[0];
    if (current.previousElementSibling) {
        selectSlide(current.previousElementSibling);
    }
}
function nextSlide() {
    var current = cElm.getElementsByClassName('shown')[0];
    if (current.nextElementSibling) {
        selectSlide(current.nextElementSibling);
    }
}

function selectSlide(slideElm) {
    var contentElm = slideElm.parentElement;
    // update the classes of slides
    for (let slide of contentElm.children)
        slide.classList.remove('shown');
    slideElm.classList.add('shown');
    // update the nav bar
    var slideIndex = Array.from(contentElm.children).indexOf(slideElm);
    // nElm is from the outer context (bad)
    for (let b of nElm.children)
        b.classList.remove('shown');
    nElm.children[1+slideIndex].classList.add('shown');
    updateUrl(slideIndex);
}

function updateUrl(slideIndex) {
    window.history.replaceState({slide: slideIndex}, 'Slide change', './#'+(slideIndex+1));
}

function genNavbar(navElm, contentElm) {
    var prevButton, nextButton;
    prevButton = document.createElement('button');
    prevButton.innerText = '<-';
    prevButton.onclick = prevSlide;
    prevButton.setAttribute('aria-label', 'previous slide');
    navElm.appendChild(prevButton);
    // Note that using var here would break functionality due to scoping rules
    var i = 0;
    for (let sl of contentElm.children) {
        let marker = document.createElement('button');
        marker.classList.add('dot');
        marker.onclick = function() { 
            selectSlide(sl); 
        };
        marker.innerText = ' ';
        marker.setAttribute('aria-labelledby', `slide-title-${i++}`);
        navElm.appendChild(marker);
    }
    nextButton = document.createElement('button');
    nextButton.innerText = '->';
    nextButton.onclick = nextSlide;
    nextButton.setAttribute('aria-label', 'next slide');
    navElm.appendChild(nextButton);
}
