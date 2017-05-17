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
    for (let sl of slides) {
        let elm = document.createElement('section');
        elm.innerHTML = marked(sl);
        elm.classList.add('slide');
        elms.push(elm);
    }
    return elms;
}

var cElm, nElm;
function startSlides(contentElm, navElm, url) {
    var url = './contents.md';
    cElm = contentElm;
    nElm = navElm;

    var xlr = new XMLHttpRequest();
    xlr.open('GET', url, true);
    xlr.send();
    xlr.addEventListener('readystatechange', function() {
        contents = this.responseText;
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            window.setTimeout(renderContents.bind(this, contentElm, this.responseText), 1000);
        }
    });

    function renderContents(rootElm, contents) {
        rootElm.innerHTML = '';
        for (let elm of makeSlideElements(contents, true))
            rootElement.appendChild(elm);
        rootElm.children[0].classList.add('shown');

    }
}

function prevSlide() {
    var current = cElm.getElementsByClassName('shown')[0];
    current.classList.remove('shown');
    current.previousElementSibling.classList.add('shown');
}
function nextSlide() {
    var current = cElm.getElementsByClassName('shown')[0];
    current.classList.remove('shown');
    current.nextElementSibling.classList.add('shown');
}
