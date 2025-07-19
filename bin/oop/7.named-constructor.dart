

// jadi disini kita akn memubuat consturcto lain selain yang default
// jadi untuk kebutuhan lainnya

class Siswa {
  late String nama;
  late int umur;
  late String prestasi;

  // ini yg consturctor default
  Siswa(this.nama, this.umur);

  // ini yg named
  // nah jadi yg nama dan si umurnya bisa kita buat menjadi defualt atau
  // ktia ambil juga dari user
  // Siswa.berprestasi(this.prestasi)
  //     : nama = "default",
  //     umur = 20;

  // bisa juga gini, di ngambil dari user / inputan
  Siswa.berprestasi(this.nama, this.umur, this.prestasi);

  // dan bisa lebih

}




void main() {

  // coba sendiri
  final jamal = Siswa("jamal", 45);
  final jamal_prestasi = Siswa.berprestasi("jamal2", 7, 'juara 1 coding');
  print(jamal.nama);
  print(jamal_prestasi.prestasi);



  var a = Angka(7);
  var b = Angka.zero();
  var c = Angka.fromString('123');
  var d = Angka.fromString('abc');

  print(a.nilai); // 7
  print(b.nilai); // 0
  print(c.nilai); // 123
  print(d.nilai); // 0 karena parsing gagal

  var m1 = Mahasiswa('Rudi', 20);
  var m2 = Mahasiswa.tanpaNama(22);

  print(m1.nama); // Rudi
  print(m2.nama); // Tidak Diketahui

  var data = {'judul': 'Laskar Pelangi', 'penulis': 'Andrea Hirata'};
  var buku = Buku.fromMap(data);

  print(buku.judul); // Laskar Pelangi
  print(buku.penulis); // Andrea Hirata
}

// Named constructor adalah **constructor tambahan** pada sebuah class
// yang memiliki **nama khusus** (selain default constructor).
// Fungsinya untuk menyediakan cara inisialisasi objek dengan logika yang
// berbeda atau konfigurasi yang spesifik.

// Penulisannya menggunakan sintaks:
// ClassName.namaConstructor(...) { ... }

// ======================================================================
// MENGAPA HARUS ADA NAMED CONSTRUCTOR?
// ======================================================================
// Alasan utama menggunakan named constructor:
// - Membuat cara alternatif untuk membuat objek dari satu class
// - Menyediakan shortcut untuk pembuatan objek dengan preset tertentu
// - Memungkinkan pemisahan logika inisialisasi objek berdasarkan konteks
// - Berguna untuk parsing data, cloning, atau kondisi spesifik lainnya

// ======================================================================
// CONTOH A: CONSTRUCTOR DEFAULT VS NAMED CONSTRUCTOR
// ======================================================================

class Mahasiswa {
  String nama;
  int umur;

  // Constructor default (utama)
  Mahasiswa(this.nama, this.umur);

  // Named constructor
  Mahasiswa.tanpaNama(this.umur) : nama = 'Tidak Diketahui';
}

// Penjelasan:
// - Constructor `Mahasiswa.tanpaNama()` adalah named constructor
// - Parameter hanya `umur`, sedangkan `nama` di-set default secara internal

// ======================================================================
// CONTOH B: NAMED CONSTRUCTOR UNTUK PARSING DARI MAP
// ======================================================================

class Buku {
  String judul;
  String penulis;

  Buku(this.judul, this.penulis);

  // Named constructor dari Map
  Buku.fromMap(Map<String, String> map)
    : this.judul = map['judul'] ?? 'Tanpa Judul',
      this.penulis = map['penulis'] ?? 'Anonim';
}

// ======================================================================
// CONTOH C: NAMED CONSTRUCTOR UNTUK KONDISI SPESIAL
// ======================================================================

class Angka {
  int nilai;

  // Constructor default
  Angka(this.nilai);

  // Named constructor khusus untuk nol
  // jadi kalo zero, maka nilainya akan kita jadi kan 0
  Angka.zero() : nilai = 0;

  // Named constructor dari string
  Angka.fromString(String s) : nilai = int.tryParse(s) ?? 0;
}

// ======================================================================
// CONTOH D: PRIVATE NAMED CONSTRUCTOR
// ======================================================================

class Logger {
  final String nama;

  // Named constructor private (pakai _)
  Logger._internal(this.nama);

  // Static instance
  static final Logger _instance = Logger._internal('SatuSatu');

  // Named constructor public sebagai factory
  factory Logger() => _instance;
}

// Penjelasan:
// - `Logger._internal` adalah named constructor private
// - Hanya bisa diakses dari dalam class Logger
// - Digunakan dalam pola singleton

// ======================================================================
// APA PERBEDAAN NAMED CONSTRUCTOR DENGAN CONSTRUCTOR BIASA?
// ======================================================================
// - Constructor biasa tidak punya nama (langsung pakai nama class)
// - Named constructor punya nama khusus (dipisahkan dengan titik)
// - Constructor biasa hanya satu, tapi kita bisa punya banyak named constructor
// - Named constructor bisa punya logika berbeda tergantung kebutuhan

// ======================================================================
// APA KELEBIHAN NAMED CONSTRUCTOR?
// ======================================================================
// ✔ Memisahkan logika inisialisasi
// ✔ Mendukung readability (kode mudah dipahami tujuannya)
// ✔ Cocok untuk factory, parsing, alias, preset
// ✔ Bisa dikombinasikan dengan inheritance atau `super`

// ======================================================================
// KAPAN HARUS MENGGUNAKAN NAMED CONSTRUCTOR?
// ======================================================================
// ✅ Saat ada cara khusus dalam membuat objek dari data berbeda (misal JSON, Map, DB)
// ✅ Saat kamu butuh preset/default value yang tidak biasa
// ✅ Saat kamu menerapkan design pattern seperti factory atau singleton

// ======================================================================
// LATIHAN: BUAT CLASS "User" DENGAN NAMED CONSTRUCTOR DARI MAP
// ======================================================================

// class User {
//   String nama;
//   int umur;

//   // Constructor utama

//   // TODO: Named constructor User.fromJson(Map<String, dynamic> json)
// }

// ======================================================================
// KESIMPULAN
// ======================================================================
// Named Constructor di Dart adalah alat penting untuk fleksibilitas dalam
// pembuatan objek. Ia membantu kita membedakan cara-cara inisialisasi tanpa
// harus membuat subclass, menjadikan kode lebih bersih, terorganisir, dan reusable.
