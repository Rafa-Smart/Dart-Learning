"use strict";
{
    // disini saya akan test membuat filter, yg ada di 
    // Array<int>
    // tambah dulu di index.d.ts
    Array.prototype.myFilter = function (filter) {
        let hasil = [];
        for (let i = 0; i < this.length; i++) {
            if (filter(i, this[i], this)) {
                hasil.push(this[i]);
            }
        }
        return hasil;
    };
    let data = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    const hasil = data.myFilter((value) => {
        return value % 2 == 0;
    });
    console.log(hasil);
}
