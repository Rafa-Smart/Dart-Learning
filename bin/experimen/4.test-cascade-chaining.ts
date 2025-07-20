// mau cek, apakah kita bisa chaining langsung pada classnya

const number:Array<number> = new Array<number>(1,2,3,4,5,6,7,8,9).reverse()
console.log(number)


// jadi bisa juga untu yg akses property dari obj
interface Test {
    nama:string,
    umur:number
}

const json:Test = {
    nama:"jamal",
    umur:15
}

function create(data:Test):Test{
    return data
}

const hasil = create(json).nama = "siti"
// nah, kalo di typescript itu, ga bisa lebih dari sekali chainingnya
// tapi kalo di dart, itu bisa banyak
// lihat di experimen 4.dart