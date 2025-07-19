{
    // kta akan memasukan method di class String
    const data = new String("jamal");
    // nah kita akn tampahkan isPalindrom
    // atau apakah bisa bolak balik
    // ini kalo pake js bisa lohh
    // String.prototype.isPalindrom = (data:string):boolean => {
    //     return data.replace(" ","") == data.replace(" ","").split("").reverse().join()
    // }
    // yg atas itu ga bisa, karena harusnya, kalo mau nambha method ke prototype,
    // kita ga bisa pke parameter, jadi harus pke si objknya aja, yaitu si this
    // dan ga bisa juga pake arrow function, kaena nanti thisnya akna masuk ke
    // lexical scopenya
    // String.prototype.isPalindrom = function():boolean {
    //     return data.replace(" ","") == this.replace(" ","").split("").reverse().join("")
    // }
    // itu ga bisa yaa, karena isPalindrom itu ga ada di interface si Stringnya
    // jadi kita harus declare dulu di global, karena interface string itu ada di global
    // dan kia tampahkan method isPalindrom
    //   nah kita sudha emndaftarkan fungsi isPalindrom di interface si stringnya
    //   nah sekarang kita akn buat implementasinya di class / di prototype si stringnya
    String.prototype.isPalindrom = function () {
        return this.replace(" ", "") == this.replace(" ", "").split("").reverse().join("");
    };
    // nah sekarang kita coba
    const data2 = "jamal";
    console.log(data2.isPalindrom()); // false

    // coba yg beneran palindrom / bisa dibalik

    const data3 = "kasur rusak";
    console.log(data3.isPalindrom()) // true
}
export {};
