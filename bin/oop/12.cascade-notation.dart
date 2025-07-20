// jadi fitur ini tuh berguna biar ga ribet aja, kalo mau akses property / method
// pada obj

class Person {
  late String nama;
  late int umur;
  Person(this.nama, this.umur);

  void setNama(namaBaru) {
    this.nama = namaBaru;
  }

  void setUmur(umurBaru) {
    this.umur = umurBaru;
  }

  void getNama() {
    print(this.nama);
  }

  void getUmur() {
    print(this.umur);
  }

  void sayHello() {
    print('haloooo $nama');
  }
}

class Person2 {
  String? nama;
  int? umur;
  // jadi disini ktia bisa buat dia opsional
  // dan juga sekaligus bisa null
  Person2([String? namaParam, int? umurParam])
    : nama = namaParam,
      umur = umurParam;

  void setNama(namaBaru) {
    this.nama = namaBaru;
  }

  void setUmur(umurBaru) {
    this.umur = umurBaru;
  }

  void getNama() {
    print(this.nama);
  }

  void getUmur() {
    print(this.umur);
  }

  void sayHello() {
    print('haloooo $nama');
  }
}

void main() {
  final Person jamal = Person('jamal', 15);
  jamal.sayHello();
  jamal.getNama();
  jamal.getUmur();
  jamal.setNama("udin");
  jamal.getNama();

  // nah disni kenapa bisa diubah, padahal final, karena;
  // Artinya, variabel jamal tidak bisa diarahkan ke objek Person lain.
  // Tapi isi objeknya (property/method) bisa diubah.
  // jamal = Person('baru', 20); // Error: 'jamal' adalah final

  // bisa juga kita set, agar propertyna ga bisa diubah
  // tapi pas di field kita bilang bahwa property ini final

  // nah dari pada kayak diatas, ktia bsia pake cascade notation

  // const Person siti = Person("siti", 17);
  // ga bisa jadi const di variable untuk obj
  // /hanya bisa kalo constructronya itu const

  print('--------------------');
  final Person siti = Person("siti", 17)
    ..sayHello()
    ..getNama()
    ..getUmur()
    ..setNama("maimunah")
    ..getNama();

  // atau kalo mau nullable
  // maka diawal cascadenya harus ?

  final Person2 siti2 = Person2()
    ?..sayHello()
    ..getNama()
    ..getUmur()
    ..setNama("maimunah")
    ..getNama();

print('------------');
    // atau kalo mau ubah
    final jamal3 = Person2("jamal222",27)
    ..nama = "udinnnn"
    ..umur = 30
    ..getNama()
    ..getUmur();


  // atau jika bsia null
  Person? createPerson(Map<String, dynamic> data){
    if(data['nama'] | data['umur'] != null){
      return Person(data['nama'], data['umur']);
    }else {
      return null;
    }
  }


   Map<String, dynamic> json = {
    "nama":"jamal",
    "umur":20
  };


  // nah krena bisa null si fungsi ini
  // maka ktia perlu pake ?
  final Person? joko = createPerson(json)
  ?..nama = 'joko'
  ..umur = 90;


}

// Cascade Notation adalah fitur di Dart yang memungkinkan kita
// untuk memanggil beberapa method dan mengakses beberapa properti
// dari objek yang sama tanpa harus menyebut nama objek berulang kali.
//
// Cascade Notation menggunakan simbol dua titik: .. (dua titik)
//
// Tujuan utama dari Cascade Notation adalah:
// - Menulis kode lebih ringkas
// - Menghindari pengulangan nama objek
// - Membuat chaining method lebih elegan dan mudah dibaca

// ====================================================================
// CONTOH TANPA CASCADE NOTATION:
// ====================================================================

class Buku {
  String judul = "";
  String penulis = "";

  void setJudul(String judul) {
    this.judul = judul;
  }

  void setPenulis(String penulis) {
    this.penulis = penulis;
  }

  void cetakInfo() {
    print("Judul: $judul, Penulis: $penulis");
  }
}

// void main() {
//   // Tanpa cascade notation
//   var buku = Buku();
//   buku.setJudul("Belajar Dart");
//   buku.setPenulis("Rafa Khadafi");
//   buku.cetakInfo();
// }

// ====================================================================
// CONTOH DENGAN CASCADE NOTATION:
// ====================================================================

// void main() {
//   var buku = Buku()
//     ..setJudul("Belajar Dart")
//     ..setPenulis("Rafa Khadafi")
//     ..cetakInfo();
// }

// ====================================================================
// PENJELASAN BARIS PER BARIS:
// ====================================================================
// var buku = Buku()
//   -> Membuat objek dari class Buku
//
// ..setJudul("Belajar Dart")
//   -> Memanggil method `setJudul` pada objek `buku` tanpa menuliskan
//      nama objek lagi
//
// ..setPenulis("Rafa Khadafi")
//   -> Memanggil method `setPenulis` pada objek yang sama
//
// ..cetakInfo();
//   -> Memanggil method `cetakInfo` untuk mencetak data objek

// ====================================================================
// CARA KERJA CASCADE NOTATION:
// ====================================================================
// Saat menggunakan tanda `..`, Dart akan mengembalikan objek asli
// dari sebelah kiri, sehingga setiap baris berikutnya tetap bekerja
// pada objek yang sama.
//
// Ini membuat kode menjadi efisien dan tidak perlu deklarasi berulang.

// ====================================================================
// BISA UNTUK MENGAKSES FIELD LANGSUNG:
// ====================================================================

// void main() {
//   var buku = Buku()
//     ..judul = "Flutter untuk Pemula"
//     ..penulis = "Rafa Dev"
//     ..cetakInfo();
// }

// ====================================================================
// PERBEDAAN `.` (DOT) VS `..` (CASCADE)
// ====================================================================
// - `.` (dot): digunakan untuk memanggil method atau field satu per satu
// - `..` (cascade): digunakan untuk memanggil banyak method/field secara berantai
//
// Contoh dengan `.`:
//   buku.setJudul("X");
//   buku.setPenulis("Y");
//
// Contoh dengan `..`:
//   buku..setJudul("X")..setPenulis("Y");

// ====================================================================
// NESTED CASCADE (TIDAK DIREKOMENDASIKAN KECUALI DIPERLUKAN):
// ====================================================================

class Perpustakaan {
  Buku buku1 = Buku();
  Buku buku2 = Buku();
}

// void main() {
//   var perpustakaan = Perpustakaan()
//     ..buku1
//       ..judul = "Dart Lanjutan"
//       ..penulis = "Rafa Khadafi"
//     ..buku2
//       ..judul = "Flutter Profesional"
//       ..penulis = "Daf Khadafi";
// }

// Hati-hati, nested cascade bisa membuat kode sulit dibaca
// Gunakan hanya jika strukturnya benar-benar membutuhkan hal tersebut

// ====================================================================
// CATATAN PENTING:
// ====================================================================
// - Cascade hanya bekerja pada objek mutable (yang bisa diubah)
// - Cascade tidak bisa digunakan untuk objek yang bertipe `null`
// - Jika ingin menggunakan cascade pada objek opsional, pastikan bukan null

// ====================================================================
// KAPAN HARUS MENGGUNAKAN CASCADE NOTATION?
// ====================================================================
// Gunakan ketika:
// - Kamu perlu melakukan banyak operasi pada objek yang sama
// - Kamu ingin menulis kode yang lebih singkat dan bersih
// - Ingin menghindari penulisan nama objek berulang-ulang

// ====================================================================
// KAPAN TIDAK DISARANKAN?
// ====================================================================
// - Jika hanya ada satu atau dua method, biasa saja dengan dot `.`
// - Jika menyebabkan nested terlalu dalam
// - Jika membuat kode sulit dibaca oleh programmer lain

// ====================================================================
// CONTOH LAIN: UNTUK BUILDER / SETUP OBJEK
// ====================================================================

class User {
  String nama = "";
  int umur = 0;

  void tampil() {
    print("Nama: $nama, Umur: $umur");
  }
}

// void main() {
//   var user = User()
//     ..nama = "Rafa"
//     ..umur = 22
//     ..tampil();
// }

// ====================================================================
// KESIMPULAN:
// ====================================================================
// Cascade Notation (`..`) di Dart sangat berguna untuk menyederhanakan
// pemanggilan berulang pada objek yang sama. Fitur ini memperindah kode,
// menghindari repetisi, dan ideal untuk inisialisasi objek atau chaining.
//
// Gunakan dengan bijak untuk meningkatkan keterbacaan dan efisiensi.
// ====================================================================
