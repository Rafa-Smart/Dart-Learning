void main(){
  // jaid disini kita akn empelajari tentang nullable
  // jadi secara default, variable itu tidak nullable
  // tapi jika kita ingin menjadikannya nullable kita bisa menggunakan ?
  String? nama; // bisa
  // final? nama; ga bsia

  // disni jika kita ingin akses, maka kita hrus null chck dulu
  // const hasil = nama.toString(); ga bsia

  if(nama != null){
    int hasil = nama.length; 
  print(hasil);
  }
  print(nama);

  // atua bsia juga langsung seperti ini

  String? nama2 = "jamal";
  String? hasil2 = nama2?.toUpperCase();
  print(nama2);
  print(hasil2);

  // nah, jaid bsia seperti ini, tapi juga, dat yang menampunya itu harus  nullable
  // karena bisa aja si nama?.toUpperCase() ini nilainya null
  // makanya variable yg mnempgnya harus nullable juga

  // 2. kita bsia memaksa, bahwa ini bukan nullable

  int? umur = 12;

  // jadi kalo kita yakin, bahsa dia ini tidak akn null
  // maka kita bsia menggunakan !

  // jadi mengubah nullable menjadi non nullable, jadi jika benar null, maka dia
  // akan error, tapi jika memang tidak null, maka tidak error

  var hasil3 = umur!.isOdd;
  print(hasil3);



}