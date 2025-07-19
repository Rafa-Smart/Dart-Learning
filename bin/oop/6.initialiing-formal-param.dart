void main(){
    // jadi kita bisa menuliskan param di constuctornya denga lebih singat

  final Siswa jamal = Siswa("Jamal", '11rpl2');
  print(jamal);

}

class Siswa {
  late String nama;
  late String kelas;
  Siswa(this.nama, this.kelas);
  void sayHi(int nama){
    print('haloo $nama, aku ${this.nama}');
  }

  @override
  String toString(){
      return 'objek Siswa{nama: $nama, kelas: $kelas} dibuat';
  }
}

// Initializing formal parameter adalah fitur khusus dalam Dart yang 
// digunakan untuk langsung menginisialisasi (mengisi) field dalam 
// constructor dengan parameter yang dikirim, TANPA perlu menuliskan
// assignment manual di dalam body constructor.

// Fitur ini sangat umum digunakan dalam pendekatan OOP (Object Oriented)
// dan sangat berguna untuk menyederhanakan kode, khususnya saat kita 
// memiliki banyak field yang ingin langsung diisi dari parameter constructor.

// ======================================================================
// BAGAIMANA CARA PENULISANNYA?
// ======================================================================
// Format dasar initializing formal parameter:
// Constructor(this.fieldName);   // langsung isi field dari parameter

// Ini hanya bisa digunakan di dalam constructor, dan hanya berlaku untuk 
// field instance dari sebuah class (bukan local variable).

// ======================================================================
// CONTOH A: TANPA MENGGUNAKAN INITIALIZING FORMAL PARAMETER
// ======================================================================

class Mahasiswa {

  // jadi kalo ga late, ktia harus menggunakan nullable
  // karena si String nama ini dia belum ada nilai default
  // jadi lnagusng ;, nah kalo gitu maka nanti akn error, karena varibale yg menampunya
  // tidak late / nullable

  // makanya ini ktia buat nullable

  late String nama;
  late int umur;

  // Constructor biasa (tanpa initializing formal)
  Mahasiswa(String nama, int umur) {
    this.nama = nama; // assignment manual
    this.umur = umur;
  }
}

// Kekurangannya:
// - Redundant (pengulangan antara parameter dan field)
// - Kurang ringkas
// - Tidak scalable jika banyak field

// ======================================================================
// CONTOH B: MENGGUNAKAN INITIALIZING FORMAL PARAMETER
// ======================================================================

class Dosen {
  String nama;
  int umur;

  // Constructor menggunakan initializing formal parameter
  Dosen(this.nama, this.umur);
}

// Penjelasan:
// - this.nama langsung mengacu pada field class, bukan parameter lokal
// - Jadi saat constructor dipanggil, field `nama` dan `umur` langsung diisi
// - Tidak perlu penulisan assignment manual

// ======================================================================
// KELEBIHAN INITIALIZING FORMAL PARAMETER
// ======================================================================
// - Mengurangi penulisan kode (boilerplate)
// - Lebih bersih dan mudah dibaca
// - Sangat membantu ketika banyak field harus diisi
// - Terintegrasi secara natural dengan class constructor di Dart

// ======================================================================
// CONTOH C: INITIALIZING FORMAL PARAMETER DENGAN NAMED PARAMETERS
// ======================================================================

class Mobil {
  String merk;
  int tahun;

  // Dengan named parameters dan initializing formal
  Mobil({required this.merk, required this.tahun});
}

// Pemanggilan:
// final m1 = Mobil(merk: 'Toyota', tahun: 2020);

// Penjelasan:
// - Karena menggunakan named parameters, maka wajib menyebut nama argumen
// - `required` membuat parameter menjadi wajib saat membuat objek

// ======================================================================
// CONTOH D: MENGGUNAKAN DEFAULT VALUE DENGAN INITIALIZING FORMAL
// ======================================================================

class Komputer {
  String merk;
  int ram;

  // nilai default pada parameter
  Komputer({this.merk = 'Generic', this.ram = 4});
}

// Pemanggilan:
// final k1 = Komputer();  // merk = 'Generic', ram = 4
// final k2 = Komputer(merk: 'Asus'); // merk = 'Asus', ram = 4

// ======================================================================
// CONTOH E: INITIALIZING FORMAL PARAMETER DALAM KONSTRUKTOR PRIVATE
// ======================================================================

class _AkunRahasia {
  final String username;
  final String password;

  // constructor private
  _AkunRahasia._(this.username, this.password);
}

// Pemanggilan hanya dari dalam class itu sendiri atau factory

// ======================================================================
// APA BEDANYA DENGAN SETTER ATAU FIELD BIASA?
// ======================================================================
// - Initializing formal hanya berlaku saat objek DIINISIALISASI pertama kali
// - Tidak bisa digunakan untuk update field setelah objek dibuat
// - Setter bisa dipakai untuk update field kapan saja

// ======================================================================
// KAPAN HARUS MENGGUNAKAN INI?
// ======================================================================
// Gunakan initializing formal parameter jika:
// - Anda ingin mengisi nilai field saat pembuatan objek (constructor)
// - Tidak perlu manipulasi atau logika khusus di dalam constructor
// - Ingin kode ringkas dan clean

// Jangan gunakan jika:
// - Anda butuh validasi atau logika kompleks saat assignment (gunakan body)
// - Anda ingin lazy initialization (penundaan inisialisasi)

// ======================================================================
// KESIMPULAN:
// ======================================================================
// Initializing Formal Parameter adalah fitur efisien di Dart untuk 
// menyederhanakan konstruktor yang hanya bertugas mengisi field dari 
// parameter. Sangat berguna untuk class data model atau entity object.

// ======================================================================
// LATIHAN SINGKAT:
// ======================================================================

// class Buku {
//   String judul;
//   String penulis;

//   // TODO: buat constructor menggunakan initializing formal parameter
// }

// final buku = Buku('Laskar Pelangi', 'Andrea Hirata');

