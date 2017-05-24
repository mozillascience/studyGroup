'use strict'

/* These variables are declared in the outside scope so they behave like global
   variables */
var cElm, nElm, contents, layoutListener;
function startSlides(contentElm, navElm, url) {
    cElm = contentElm;
    nElm = navElm;

    // XMLHttpRequest is the key to "AJAX"
    // Many libraries will provide easier function for this
    var xlr = new XMLHttpRequest();
    xlr.open('GET', url, true);
    xlr.send();
    /* The simplest event listener is just a call-back function.
     * This is the first step to asynchronous execution */
    xlr.addEventListener('readystatechange', function() {
        contents = this.responseText;
        /* I'm doing a timeout just to show callbacks and binding arguments */
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            window.setTimeout(setup.bind(this, contentElm, navElm), 500);
        }
    }); /* often there will be some combo of braces, parens, and semicolons
           to finish of statements, either because of call-backs or scope */
    
    /* Because these functions are defined inside `startSlides()`,
     * they cannot be accessed outside of the current scope. 
     * They are hoisted, so that they can be used earlier in the function. */
    function setup(contentElm, navElm) {
        renderContents(contentElm, this.responseText);
        navElm.innerHTML = '';
        genNavbar(navElm, contentElm);
        // On loading, we determine which slide to show based on the hash
        var h = location.hash;
        if (h === '')
            selectSlide(cElm.children[0]);
        else {
            let slideIndex = parseInt(h.slice(1)) - 1;
            selectSlide(cElm.children[slideIndex]);
        }
    }

    function renderContents(rootElm, contents) {
        /* Setting the innerHTML will remove all elements there, generate
         * a new DOM tree from the HTML, add attach it to the root element.
         */
        rootElm.innerHTML = '';
        for (let elm of makeSlideElements(contents, true))
            rootElm.appendChild(elm);
        rootElm.children[0].classList.add('shown');
    }

    /* Handle the hotkeys for switching slides
     * Again, we just use an anonymous function */
    window.addEventListener('keyup', function(keyEvent) {
        // switch-case statements are useful for handling inputs
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
    }, true); /* `true` sets the order of evaluation of events (bubbling)
                 it has no effect here, but you can be aware of it */

    // layoutListener is in the global scope so that I can demo something
    layoutListener = function(keyEvent) {
        switch(keyEvent.key) {
            case 's':
                toggleShowAll(cElm);
                break;
            case 'v':
                toggleHorizontal(cElm);
        }
    }; // semicolons after variable assignment
    /* Handle hotkeys for changing the layout
     * notice that the event listeners are both run
     * By using a named listener, we can remove this functionality
     * with `.removeEventListener`
     */
    window.addEventListener('keyup', layoutListener);

    // This handles the user changing the hash on the url
    window.onpopstate = function () {
        var slideIndex = location.hash.slice(1)-1;
        selectSlide(cElm.children[slideIndex]);
    }

}

/* making the nav bar (actually used by the startSlides function, but hoisted from here
 */
function genNavbar(navElm, contentElm) {
    // sometimes people predefine all variables at the start
    var prevButton, nextButton;
    /* Complicated elements can involve a lot of statements
     * HTML5 added `<template>` objects which make it easier to define elements
     * with html */
    var template = document.createElement('template');
    // a library could help with string formatting
    var tHTML = function(np, text) {
        return `<button id="${np}-slide-button" aria-label="${np} slide" aria-controls="content">${text}</button>`;
    };
    template.innerHTML = tHTML('previous', '&lt;');
    prevButton = template.content.lastChild;
    prevButton.onclick = prevSlide;
    navElm.appendChild(prevButton);
    var i = 0;
    for (let sl of contentElm.children) {
        template.innerHTML += `<button class="dot" aria-labelledby="slide-title-${i++}" aria-controls="content"> </button>`;
        let marker = template.content.lastChild;
        marker.onclick = function() { 
            /* Note that using `var` for `sl` would break functionality due to
             * scoping rules */
            selectSlide(sl); 
        };
        navElm.appendChild(marker);
    }
    template.innerHTML += tHTML('next', '&gt;');
    nextButton = template.content.lastChild;
    nextButton.onclick = nextSlide;
    navElm.appendChild(nextButton);
    /* This line could be used instead of each individual appendChild,
     * but `innerHTML +=` recreates DOM elements, removing attached event
     * listeners
    navElm.appendChild(document.importNode(template.content, true));
    */
}


/* The rest of the functions are defined in global scope
 * so I can access them from commandline as well.
 */
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

/* This function really does all the work
 */
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
    /* `window.history` keeps track of forward/back
     * `replaceState` changes the current place in history, while
     * `pushState` would add to the history chain
     */
    window.history.replaceState({slide: slideIndex}, 
            'Slide change', 
            './#'+(slideIndex+1));
}


/* These functions are a bit pointless, because the inside is the same as the
 * name... but
 * if this functionality is used in multiple places and the implementation
 * changes, then I only need to make that change here. */
function toggleShowAll(cElm) {
    cElm.classList.toggle('show-all');
}

function toggleHorizontal(cElm) {
    cElm.classList.toggle('horizontal');
}

// making the actual slide elements
function makeSlideElements(text, addParent) {
    var slides = splitContents(text);
    if (addParent)
        slides = addParentSection(slides);
    var elms = [];
    for (let i in slides) {
        let elm = document.createElement('section');
        // `marked` comes from the markdown parser import in the HTML
        elm.innerHTML = marked(slides[i]);
        elm.classList.add('slide');
        // Shortcut evaluation with `||` (or) to grab the heading
        let heading = elm.getElementsByTagName('h1')[0] ||
                  elm.getElementsByTagName('h2')[0];
        // git the heading an id, for `aria-labelledby`
        heading.id = `slide-title-${i}`
        elms.push(elm);
    }
    return elms;
}


/* Just some string-handling functions */
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

