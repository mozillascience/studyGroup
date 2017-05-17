'use strict'

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
            result[i] = `# `.concat(prev, '\n', slides[i]);
        else {
            prev = slides[i].split('\n')[0].slice(1).trim();
            result[i] = slides[i];
        }
    }
   return result;
} 

