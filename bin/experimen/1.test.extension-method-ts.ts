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

    String.prototype.isPalindrom = (data:string):boolean => {
        return data.replace(" ","") == data.replace(" ","").split("").reverse().join()
    }

}