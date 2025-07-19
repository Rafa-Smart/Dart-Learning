// tes this kalo di prototype pake arrow
String.prototype.tes = () => {
    console.log(`ini this: ${this}`)
}

const jamal = 'test';
jamal.tes() // ini this: [object Object]
// jadi merujuk ke window

// tapi kalo pake default function

String.prototype.tes2 = function() {
    console.log(`ini this: ${this}`)
}

const jamal2 = "Jamal Istiqomah";
jamal2.tes2() // ini this: Jamal Istiqomah
// mrujuk ke objeknya