// https://chatgpt.com/c/687b4b06-ae20-8009-9ec9-19563f000b20
class Mahasiswa {
  // membuat filed dulu, dan ini wajib
  int? umur;
  String? nama;
  final String tempat = "Indonesia";

  Mahasiswa(int umur, String nama) {
    this.umur = umur;
    this.nama = nama;
  }

  // disini buat method, yg masuk ke classnya / prototypenya

  void sayHi(String nama){
    print('haloo $nama saya ${this.nama} umur $umur');
  }

  // overide ketika di print obj instancenya
  @override
  String toString(){
    return 'objek ${this.nama} telah dibuat.';
  }

}




void main() {

  final Mahasiswa jamal = Mahasiswa(12, 'jamal');

  print(jamal);
  jamal.sayHi('siti');

  // jadi di constructor ini, wajib diisi paramnya
  final Mahasiswa siti = Mahasiswa(15, "siti");
  print(siti);



  // Membuat objek dari class Person
  var orang1 = Person('Rafa', 21);
  orang1.showInfo(); // Output: Nama: Rafa, Umur: 21 tahun

  var kucing = Hewan('Kucing', 4);
  kucing.info(); // Output: Hewan Kucing berkaki 4

  var motor = Kendaraan('Motor', 2);
  var perahu = Kendaraan.tanpaRoda('Perahu');
  motor.detail(); // Kendaraan Motor, Roda: 2
  perahu.detail(); // Kendaraan Perahu, Roda: 0

  const titikA = Titik(3, 4);
  const titikB = Titik(3, 4);

  // titikA dan titikB menunjuk ke instance yang sama (karena const)
  print(identical(titikA, titikB)); // Output: true

  var bayi = Siswa.bayi('Bayu');
  print('${bayi.nama}, umur: ${bayi.umur}'); // Bayu, umur: 0
}

// Constructor adalah sebuah method khusus di dalam class yang dipanggil
// secara otomatis ketika objek dari class tersebut dibuat (instansiasi).
// Tujuan utamanya adalah untuk menginisialisasi nilai awal (initial value)
// dari properti/properti class saat objek dibuat.

// ============================================
// Mengapa menggunakan Constructor?
// ============================================
// 1. Untuk memberikan nilai awal pada field (properti) objek.
// 2. Untuk membuat objek dengan kondisi tertentu.
// 3. Untuk menghindari kode duplikat saat inisialisasi.
// 4. Untuk menerapkan validasi nilai saat pembuatan objek.

// ============================================
// Cara kerja Constructor:
// ============================================
// - Constructor adalah method yang memiliki nama sama dengan class.
// - Constructor tidak memiliki tipe kembalian (return type).
// - Constructor dipanggil otomatis saat kita membuat instance dari class.

// ============================================
// Contoh dasar Constructor di Dart:
// ============================================

class Person {
  // Properti (field) dari class Person
  String? name;
  int? age;

  // Constructor dari class Person
  Person(String nameInput, int ageInput) {
    // Mengisi nilai field menggunakan parameter
    this.name = nameInput;
    this.age = ageInput;
  }

  // Method untuk menampilkan info
  void showInfo() {
    print('Nama: $name, Umur: $age tahun');
  }
}

// void main() {
//   // Membuat objek dari class Person
//   var orang1 = Person('Rafa', 21);
//   orang1.showInfo(); // Output: Nama: Rafa, Umur: 21 tahun
// }

// ============================================
// Constructor dengan Parameter yang Lebih Singkat
// ============================================
// Dart menyediakan cara penulisan constructor yang lebih singkat
// menggunakan "parameter inisial langsung ke field".

class Hewan {
  String jenis;
  int kaki;

  // Constructor versi ringkas
  Hewan(this.jenis, this.kaki);

  void info() => print('Hewan $jenis berkaki $kaki');
}

// void main() {
//   var kucing = Hewan('Kucing', 4);
//   kucing.info(); // Output: Hewan Kucing berkaki 4
// }

// ============================================
// Constructor Named (Constructor Bernama)
// ============================================
// Constructor juga bisa memiliki nama. Fungsinya untuk membuat constructor
// alternatif dengan cara kerja atau parameter yang berbeda.

class Kendaraan {
  String? tipe;
  int? roda;

  // Constructor default
  Kendaraan(this.tipe, this.roda);

  // Constructor bernama: tanpa roda
  Kendaraan.tanpaRoda(String tipe) {
    this.tipe = tipe;
    this.roda = 0;
  }

  void detail() => print('Kendaraan $tipe, Roda: $roda');
}

// void main() {
//   var motor = Kendaraan('Motor', 2);
//   var perahu = Kendaraan.tanpaRoda('Perahu');
//   motor.detail();  // Kendaraan Motor, Roda: 2
//   perahu.detail(); // Kendaraan Perahu, Roda: 0
// }

// ============================================
// Constructor Const (Constructor Konstanta)
// ============================================
// Jika sebuah objek tidak berubah nilainya (immutable), Dart mendukung
// constructor bertipe const. Objek akan dibuat pada waktu kompilasi,
// bukan saat runtime (lebih efisien dan hemat memori).

class Titik {
  final int x;
  final int y;

  // Constructor const
  const Titik(this.x, this.y);
}

// void main() {
//   const titikA = Titik(3, 4);
//   const titikB = Titik(3, 4);

//   // titikA dan titikB menunjuk ke instance yang sama (karena const)
//   print(identical(titikA, titikB)); // Output: true
// }

// ============================================
// Initializer List
// ============================================
// Jika ingin menginisialisasi field sebelum constructor berjalan penuh,
// bisa pakai Initializer List, yaitu menggunakan tanda ":" setelah
// parameter constructor.

class Mahasiswa2 {
  final String nama;
  final int nim;

  Mahasiswa2(String inputNama, int inputNim) : nama = inputNama, nim = inputNim;

  void cetak() => print('Mahasiswa $nama dengan NIM $nim');
}

// ============================================
// Redirecting Constructor (Constructor Pengarah)
// ============================================
// Memungkinkan satu constructor mengarahkan ke constructor lain.

class Siswa {
  String nama;
  int umur;

  // Constructor utama
  Siswa(this.nama, this.umur);

  // Constructor redirect
  Siswa.bayi(String nama) : this(nama, 0);
}

// void main() {
//   var bayi = Siswa.bayi('Bayu');
//   print('${bayi.nama}, umur: ${bayi.umur}'); // Bayu, umur: 0
// }

// ============================================
// Constructor Private (Khusus di Dalam File yang Sama)
// ============================================
// Jika nama constructor diawali dengan underscore (_), maka constructor
// itu hanya bisa diakses di file yang sama (mirip private di OOP).

class Database {
  Database._privateConstructor();

  static final Database instance = Database._privateConstructor();
}

// Database.instance hanya bisa digunakan di file ini.

// ============================================
// Kesimpulan:
// ============================================
// - Constructor adalah cara untuk mengatur nilai awal dari objek.
// - Dart mendukung banyak bentuk constructor: default, named,
//   redirecting, initializer list, const, dan private.
// - Penggunaan constructor membantu menjaga objek tetap valid
//   dan memperjelas cara penggunaannya.


