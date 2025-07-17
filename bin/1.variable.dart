// jadi di bin ini adalah directory sebagai tempat untuk menyimpan file file aplikasi
// untuk menjalankan file dart, itu kita menggunakan
// dart run bin/nama_file.dart -> jika tidak didalam bin
// jika didalam bin maka dart run nama_file

// https://chatgpt.com/c/68774645-6160-8009-bb61-eabf9219d2b5

// jadi di dart itu wajib menyebutkan variable

// deklarasi lansgung
// jadi cocok keika langsung ingin mengisikan valuenya

void main() {
  // macam macam variable
  // 1. explisit variable
  // jadi kita mendeklarasikan tipe data langsung ketika membuat variable

  // String nama = 'jamal';
  // double umur = 20;
  // dan bisa diubah ubah sesuai tipedtanya

  // 2. var variable
  // jadi ketika kita mmebuat variable bisa saja kia langsung
  // dan ini runtime dinamis
  // contoh
  var nama2 = 'siti';
  var umur2 = 24;

  // nah jadi ini akan otomatis terbaca dari si nilainya
  // jika nilainya itu 23, maka otomatis akan int tipenya
  // dan seterusnya
  umur2 = 3; // bisa

  // dan kalo gini
  // var nama9;
  // ini akan dikira dinamyc jadi bisa dirubah kapan saja dan pake apa aja
  // nama9 = 'ss';
  // nama9 = 9;

  // 3. const
  // jadi ketika kita sudah tentukan vriable dengna nilai ini maka
  // variable tersebut tidak bsia diubah lagi
  // baik ketika runtime maupun compile
  // penjelasan:
  // https://chatgpt.com/c/68775460-08ac-8009-95a4-7c8dfcb610c6
  // jadi compile itu sebelum dijalankan, pas nyimpan data, dll, kalo
  // runtime itu ketik dijalankan
  // const nama3; -> ga bisa -> error
  // karena harus diisi dan diketahui ketika compile

  const nama3 = 'jamal';
  // nama3 = 'fdfd'; -> ga bisa, kaerna diubah ketika compile
  // dan inijuga ga bisa diubah ketika runtime yaa

  // 4. final
  // jadi variable
  final nama4 = 'jamal';
  // nama4 = 'tt'; -> error ketika compile, dn ga bisa dirubah
  // jadi ga bisa dirubah ketika compile, tapi bisa dirubah ketika runtime

  // ini conoth deklarasi variable secara runtime
  // const date = DateTime(2017, 9, 7, 17, 30);
  // ga bisa karena cosnt ga bisa hanlde deklarasi variable secara runtime

  final date = DateTime(2017, 9, 7, 17, 30);
  // ini bisa kaerna final bisa handle deklarasi variable secara runtime
  // tapi ga bisa diubha lagi, baik itu runtime atau ketika compile

  //4. dinamic, jadi sangat fleksible
  // bisa diubah ubah ketika runtime, compile dan juga bebas tipedatanya

  // 5. late
  // jadi jika kamu igin membuat variable yg sudah yakin dan pasti akan di
  // deklarasikan atau diisikan nanti
  // jadi menggunakan late
  // dan bisa di gabungkan dengan tipe variable yg lain

  // late nama5;  -> ga bisa, error
  // jadi harus di deklarasikan bersama tipenya
  // late const nama7 = 'jamal'; -> ga bisa
  // karena const itukan harus diisi ketika compile,jadi ga bisa dinanti nanti

  // dan kalo late itu ektika kita panggil fungsi, maka fungsi ini
  // tidak akan dijalankan dulu, kecuali jika variable yg menampunya dijalankan
  print('------------');
  // coba dulu yg tidak
  String getValue() {
    print("ini jamal");
    return 'jamal';
  }

  ;

  var nama10 = getValue();
  print('halooo dulu');
  print(nama10);

  // maka urutanya gini
  // 1. print("ini jamal")
  // karena ketika di panggil fungsi getValue ini, dia akna otomatis
  // menjalankan print yg ada didalamnya
  // 2. print("halooo")
  // 3.print("jamal")

  // tapi kalo pake late
  // jadi segala sesuati yg dialakukan di fungisny tidak akan dijalanakn
  // sampai variable yg enyimpannya it dijalankan
  print('\n');
  late var nama11 = getValue();
  print("helooo dulu");
  print(nama11);
    // maka urutanya gini
  // 1. print("halooo")
  // 2. print("ini jamal")
  // 3. print("jamal")

  print('------------');

  late final nama7 = 'jamal';
  // /nah ini juga bisa

  // late var nama8; // ini juga bisa
  // nama8 = 'jini';

  // coba coba aja
  final date2 = DateTime.now(); // -> bisa
  // const date23 = new DateTime.now(); // ga bisa/
  var date3 = DateTime.now();
  // bisa

  // dan kalo
  final array1 = [1, 2, 3];
  const array2 = [1, 2, 3];

  array1[0] = 12; // bisa
  // array2[0] = 4; ga bisa, jadi emang ga eeror
  // pas ketika di ketik / compile, tapi error ketika runtime
  // print('Nama: $nama');  // Menambahkan penggunaan variabel nama

  // Contoh penggunaan variabel lain dari kode asli
  print('Nama2: $nama2');
  print('Umur2: $umur2');
  print('Nama3: $nama3');
  print('Nama4: $nama4');
  print('Nama7: $nama7');
  // print('Nama8: $nama8');
  print('Tanggal: $date');
  print('Tanggal2: $date2');
  print('Tanggal3: $date3');
  print('Array1: $array1');
  print('Array2: $array2');

  // tapi kalo kita deklarasikan ulang
  // array1 = [5,6,7]; ga bisa
  // array2 = [4,5,6]; ga bisa juga

  // 1. Compile-time (waktu kompilasi)
  // Terjadi saat kamu mengetik, menyimpan, atau menjalankan perintah dart compile atau dart run.
  // Error ini biasanya langsung terdeteksi oleh IDE (seperti VS Code) atau saat proses kompilasi.
  // Contoh error:
  // Salah sintaks.
  // Tipe data salah.
  // Akses variabel yang tidak dideklarasikan.
  // Menulis const array = [1,2,3]; array = [4,5,6]; → compile error.
  // Error compile-time muncul sebelum program dijalankan.
  // 2. Runtime (waktu program berjalan)
  // Terjadi setelah program dikompilasi dan sedang dijalankan (dart run).
  // Tidak terdeteksi saat kamu mengetik — error baru muncul saat baris tersebut dijalankan.
  // Contoh:
  // Membagi dengan 0: int x = 5 ~/ 0;
  // Akses index yang tidak ada di list: list[100];
  // Mengubah list const:
  // const a = [1,2,3];
  // a[0] = 9; // error saat dijalankan, bukan saat diketik
  // Error runtime baru muncul saat kode dijalankan, meskipun waktu ngetik terlihat "baik-baik saja".

  // APA ITU VARIABEL?
  // Variabel adalah tempat untuk menyimpan data dalam memori komputer.
  // Dalam Dart, variabel digunakan untuk menyimpan nilai yang dapat digunakan kembali,
  // dimodifikasi, atau hanya untuk dibaca di bagian program tertentu.

  // KENAPA KITA MEMBUTUHKAN VARIABEL?
  // - Untuk menyimpan nilai agar bisa digunakan berulang kali
  // - Untuk membuat kode lebih fleksibel dan mudah dimodifikasi
  // - Untuk meningkatkan keterbacaan dan pengelolaan data

  // BAGAIMANA CARA KERJA VARIABEL?
  // Ketika variabel dibuat, Dart menyimpan data tersebut di memori dengan nama tertentu.
  // Nama ini bisa digunakan kembali untuk membaca atau memodifikasi data.
  // Dart adalah bahasa yang strongly typed dan optionally typed, artinya:
  // - Anda bisa mendeklarasikan variabel dengan tipe eksplisit (int, String, dll)
  // - Atau menggunakan kata kunci seperti var, dynamic, final, const, late

  // ================================
  // JENIS-JENIS VARIABEL DI DART
  // ================================

  // 1. VARIABEL DENGAN KATA KUNCI `var`
  // Kata kunci `var` akan membuat Dart secara otomatis menentukan tipe berdasarkan nilai awal (type inference).

  void contohVar() {
    // var nama = 'Rafa'; // Dart tahu ini tipe String
    // var umur = 20; // Dart tahu ini tipe int

    // nama = 123; // ERROR: tidak bisa mengubah tipe menjadi int, karena sudah dikenali sebagai String
  }

  // 2. VARIABEL DENGAN TIPE DATA YANG DITULIS SECARA EKPLISIT
  // Anda bisa menentukan tipe data secara langsung untuk kejelasan
  void contohTipeEksplisit() {
    // String nama = 'Rafa';
    // int umur = 20;
    // double tinggi = 170.5;
    // bool isStudent = true;
  }

  // 3. VARIABEL DENGAN `dynamic`
  // `dynamic` adalah tipe yang dapat menyimpan nilai dari tipe apa pun dan bisa berubah tipe di runtime
  void contohDynamic() {
    // dynamic data = 'halo';
    // data = 123;
    // data = true;
    // Gunakan dynamic hanya jika benar-benar perlu, karena bisa berisiko menyebabkan error saat runtime
  }

  // 4. VARIABEL DENGAN `final`
  // `final` artinya nilainya tidak bisa diubah setelah diinisialisasi
  // Final bisa diisi nilai runtime (tidak harus diketahui saat compile time)
  void contohFinal() {
    // final nama = 'Rafa'; // nilai bisa berasal dari input user, API, dll
    // nama = 'Budi'; // ERROR: tidak bisa mengubah nilai
  }

  // 5. VARIABEL DENGAN `const`
  // `const` artinya nilai bersifat konstan dan harus diketahui saat COMPILE TIME
  void contohConst() {
    // const pi = 3.14;
    // const waktu = DateTime.now(); // ERROR: nilai waktu tidak bisa dihitung saat compile
  }

  // 6. PERBEDAAN `final` vs `const`
  // - `final` digunakan untuk nilai yang tidak berubah setelah pertama kali di-set, tapi bisa ditentukan saat runtime
  // - `const` digunakan untuk nilai tetap yang harus diketahui saat compile time
  // final waktuSekarang = DateTime.now(); // VALID
  // const waktuSekarang = DateTime.now(); // INVALID

  // 7. VARIABEL DENGAN `late`
  // `late` memberitahu Dart bahwa variabel akan diinisialisasi nanti, tapi bukan null
  late String pesan;
  void contohLate() {
    pesan = 'Data baru tersedia';
    print(pesan);
  }

  // ==============================
  // KONSEP LAIN: VARIABEL GLOBAL DAN LOKAL
  // ==============================

  // Variabel lokal: hanya bisa digunakan di dalam fungsi
  void contohVariabelLokal() {
    var lokal = 'Hanya dalam fungsi ini';
    print(lokal);
  }

  // Variabel global: dideklarasikan di luar fungsi, bisa digunakan di seluruh file
  // String global = 'Variabel global';

  // ==============================
  // DEFAULT VALUE (NILAI DEFAULT)
  // ==============================
  // Semua variabel yang tidak diinisialisasi akan bernilai `null` di Dart,
  // KECUALI jika menggunakan `late`, `final`, atau `const` tanpa inisialisasi langsung.

  // String? bisaNull; // dengan ? maka bisa null
  // print(bisaNull); // null

  // ==============================
  // SHORTHAND (DEKLARASI RINGKAS)
  // ==============================
  // Anda bisa mendeklarasikan dan menginisialisasi dalam satu baris seperti ini:
  // int a = 10, b = 20, c = 30;

  // ==============================
  // VARIABEL DI DALAM CLASS
  // ==============================
  // class Mahasiswa {
  //   String nama;
  //   final String nim;
  //   static const String universitas = 'Universitas Dart';

  //   Mahasiswa(this.nama, this.nim);
  // }

  // Penggunaan:
  // void contohClass() {
  //   var mhs = Mahasiswa('Rafa', '123456');
  //   print(mhs.nama);
  //   print(Mahasiswa.universitas); // akses static variabel
  // }

  // ==============================
  // RINGKASAN PENGGUNAAN
  // ==============================
  // - Gunakan `var` jika ingin Dart menebak tipe, tapi tidak berubah tipe setelah itu
  // - Gunakan `final` untuk nilai tetap yang ditentukan saat runtime
  // - Gunakan `const` untuk nilai tetap yang diketahui saat compile time
  // - Gunakan `dynamic` jika tidak tahu tipe atau bisa berubah-ubah (gunakan dengan hati-hati)
  // - Gunakan `late` jika Anda perlu inisialisasi setelah deklarasi
  contohVar();
  contohTipeEksplisit();
  contohDynamic();
  contohFinal();
  contohConst();
  contohLate();
  contohVariabelLokal();
  // contohClass();
}
