// jadi di bin ini adalah directory sebagai tempat untuk menyimpan file file aplikasi
// untuk menjalankan file dart, itu kita menggunakan
// dart run bin/nama_file.dart -> jika tidak didalam bin
// jika didalam bin maka dart run nama_file

void main() {
  contohVar();
  contohTipeEksplisit();
  contohDynamic();
  contohFinal();
  contohConst();
  contohLate();
  contohVariabelLokal();
  contohClass();
}


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
  var nama = 'Rafa'; // Dart tahu ini tipe String
  var umur = 20; // Dart tahu ini tipe int

  // nama = 123; // ERROR: tidak bisa mengubah tipe menjadi int, karena sudah dikenali sebagai String
}

// 2. VARIABEL DENGAN TIPE DATA YANG DITULIS SECARA EKPLISIT
// Anda bisa menentukan tipe data secara langsung untuk kejelasan
void contohTipeEksplisit() {
  String nama = 'Rafa';
  int umur = 20;
  double tinggi = 170.5;
  bool isStudent = true;
}

// 3. VARIABEL DENGAN `dynamic`
// `dynamic` adalah tipe yang dapat menyimpan nilai dari tipe apa pun dan bisa berubah tipe di runtime
void contohDynamic() {
  dynamic data = 'halo';
  data = 123;
  data = true;
  // Gunakan dynamic hanya jika benar-benar perlu, karena bisa berisiko menyebabkan error saat runtime
}

// 4. VARIABEL DENGAN `final`
// `final` artinya nilainya tidak bisa diubah setelah diinisialisasi
// Final bisa diisi nilai runtime (tidak harus diketahui saat compile time)
void contohFinal() {
  final nama = 'Rafa'; // nilai bisa berasal dari input user, API, dll
  // nama = 'Budi'; // ERROR: tidak bisa mengubah nilai
}

// 5. VARIABEL DENGAN `const`
// `const` artinya nilai bersifat konstan dan harus diketahui saat COMPILE TIME
void contohConst() {
  const pi = 3.14;
  // const waktu = DateTime.now(); // ERROR: nilai waktu tidak bisa dihitung saat compile
}

// 6. PERBEDAAN `final` vs `const`
// - `final` digunakan untuk nilai yang tidak berubah setelah pertama kali di-set, tapi bisa ditentukan saat runtime
// - `const` digunakan untuk nilai tetap yang harus diketahui saat compile time
final waktuSekarang = DateTime.now(); // VALID
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
String global = 'Variabel global';

// ==============================
// DEFAULT VALUE (NILAI DEFAULT)
// ==============================
// Semua variabel yang tidak diinisialisasi akan bernilai `null` di Dart,
// KECUALI jika menggunakan `late`, `final`, atau `const` tanpa inisialisasi langsung.

String? bisaNull; // dengan ? maka bisa null
// print(bisaNull); // null

// ==============================
// SHORTHAND (DEKLARASI RINGKAS)
// ==============================
// Anda bisa mendeklarasikan dan menginisialisasi dalam satu baris seperti ini:
int a = 10, b = 20, c = 30;

// ==============================
// VARIABEL DI DALAM CLASS
// ==============================
class Mahasiswa {
  String nama;
  final String nim;
  static const String universitas = 'Universitas Dart';

  Mahasiswa(this.nama, this.nim);
}

// Penggunaan:
void contohClass() {
  var mhs = Mahasiswa('Rafa', '123456');
  print(mhs.nama);
  print(Mahasiswa.universitas); // akses static variabel
}

// ==============================
// RINGKASAN PENGGUNAAN
// ==============================
// - Gunakan `var` jika ingin Dart menebak tipe, tapi tidak berubah tipe setelah itu
// - Gunakan `final` untuk nilai tetap yang ditentukan saat runtime
// - Gunakan `const` untuk nilai tetap yang diketahui saat compile time
// - Gunakan `dynamic` jika tidak tahu tipe atau bisa berubah-ubah (gunakan dengan hati-hati)
// - Gunakan `late` jika Anda perlu inisialisasi setelah deklarasi


