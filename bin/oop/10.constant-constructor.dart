

// const constructor memungkinkan objek dibuat saat compile-time, dan sangat cocok untuk data tetap yang tidak berubah.
// Supaya objek benar-benar immutable dan dibagikan di memori, variabel yang menampung harus juga const, bukan hanya final atau var.
// identical() akan true hanya jika:
// Constructor adalah const
// Dan objek dibuat menggunakan const juga
// final, var, late final tetap membuat salinan baru dari objek meskipun constructor-nya const.


// /jadi gini simplenya, const constructor itu, berguna kteika kita ingin hemat memory
// karena kalo kita buat 2 objek instance, dengan param constructor yang sma
// maka dart akan menyimpannya dalam memory yang sama, jadi efesien

// dan juga kita jadi bisa menampung objeknya menggunakan variableyang constan
// kan bisanya klo ga pake const constructor, maka kita ga bisa pake ocnst
// hanya bisa pake var, final, dll

// dan juga seluruh fieldnya itu wajib menggunakan final

class Person {
  // late final String name;
  // late final int umur;

  // gaboleh pake late, dan harus final
  final String name;
  final int umur;
  const Person(this.name, this.umur);
}



void main() {

    const Person jamal = Person("jamal", 14);
    const Person jamal2 = Person("jamal", 14);
    const hasil = identical(jamal, jamal2);
    print(hasil); // true

    // var Person siti = Person("siti", 17); -> ga bisa



    // Membuat objek dengan const
    const k1 = Koordinat(10, 20);
    const k2 = Koordinat(10, 20);

    // Objek dengan nilai sama dan dibuat dengan const akan identik
    print(identical(k1, k2)); // output: true
}

// https://chatgpt.com/c/687ba3d0-9db8-8009-8a53-467a6677f3ec
// Apa itu Const Constructor?
// Const Constructor adalah jenis constructor di Dart yang dapat digunakan
// untuk membuat **instance objek yang bersifat konstan (immutable / tidak bisa diubah)**,
// dan objek tersebut bisa dibuat pada waktu kompilasi (compile-time), bukan saat runtime.

// Objek yang dibuat dengan const constructor akan dianggap **identik (identical)**
// jika nilainya sama, karena hanya disimpan satu kali di memori.

// ==============================================
// Bentuk Dasar Const Constructor:
// ==============================================

// class NamaClass {
//   final Tipe namaField;
//   const NamaClass(this.namaField);
// }

// ==============================================
// Syarat Membuat Const Constructor:
// ==============================================

// 1. Semua field dalam class HARUS bersifat `final` (tidak boleh diubah).
// 2. Constructor harus diawali dengan keyword `const`.
// 3. Bisa digunakan untuk membuat instance yang bisa disimpan di memori tetap (canonical).

// ==============================================
// Contoh Paling Sederhana:
// ==============================================

class Koordinat {
  final int x;
  final int y;

  // Const constructor
  const Koordinat(this.x, this.y);
}

// ==============================================
// Cara Menggunakan Const Constructor:
// ==============================================

// void main() {
//   // Membuat objek dengan const
//   const k1 = Koordinat(10, 20);
//   const k2 = Koordinat(10, 20);

//   // Objek dengan nilai sama dan dibuat dengan const akan identik
//   print(identical(k1, k2)); // output: true
// }

// ==============================================
// Mengapa Harus Menggunakan Const Constructor?
// ==============================================

// 1. Optimalisasi Memori:
//    Objek dengan nilai identik hanya disimpan satu kali dalam memori,
//    sehingga lebih efisien untuk performance.

// 2. Compile-Time Constant:
//    Objek sudah dibuat saat kompilasi, bukan saat runtime.

// 3. Immutable Object:
//    Cocok untuk representasi data tetap yang tidak boleh berubah,
//    misalnya konfigurasi, posisi tetap, status awal, dan sebagainya.

// 4. Digunakan di UI Framework (Flutter):
//    `const` sangat sering digunakan dalam deklarasi widget agar rebuild lebih efisien.

// ==============================================
// Perbandingan const dan new / default:
// ==============================================

void contohPerbandingan() {
  const a = Koordinat(1, 2);
  const b = Koordinat(1, 2);
  final c = Koordinat(1, 2); // ini final tapi tidak const
  var d = Koordinat(1, 2); // ini mutable instance (jika bukan final)

  print(identical(a, b)); // true - sama secara fisik di memori
  print(identical(a, c)); // false - berbeda walaupun isinya sama
  print(identical(c, d)); // false
}

// ==============================================
// Const Constructor dengan Named Constructor:
// ==============================================

class Warna {
  final int r;
  final int g;
  final int b;

  // Named const constructor
  const Warna.rgb(this.r, this.g, this.b);
}

// Penggunaan:
const merah = Warna.rgb(255, 0, 0);
const merahLagi = Warna.rgb(255, 0, 0);

// ==============================================
// Const vs Final
// ==============================================

// - `final`: hanya berarti nilainya tidak bisa diubah SETELAH diberikan.
// - `const`: berarti nilainya tetap dan DIBUAT pada saat kompilasi.

// Contoh:

final waktuSekarang = DateTime.now(); // ini valid
// const waktuTetap = DateTime.now(); // ERROR: const harus bisa ditentukan saat kompilasi

// Tapi:
const angkaTetap =
    100; // valid, karena literal int adalah compile-time constant

// ==============================================
// Const Constructor Bersama Collection (Const List / Map / Set):
// ==============================================

class Titik {
  final int x;
  final int y;
  const Titik(this.x, this.y);
}

// Kita bisa membuat list yang berisi objek const
const daftarTitik = [Titik(0, 0), Titik(1, 1), Titik(2, 2)];

// ==============================================
// Kombinasi dengan Initializer List
// ==============================================

class Ukuran {
  final int lebar;
  final int tinggi;
  final int luas;

  const Ukuran(this.lebar, this.tinggi) : luas = lebar * tinggi;
}

// Objek di atas sah karena initializer list dihitung secara konstan

// ==============================================
// Konstanta Global dan Reusable Object
// ==============================================

const pi = 3.14159;

class Lingkaran {
  final double jari;
  const Lingkaran(this.jari);

  double get luas => pi * jari * jari;
}

const l1 = Lingkaran(7); // compile-time const

// ==============================================
// Catatan Tambahan:
// ==============================================

// 1. Jika ingin membuat objek const, tapi tidak tahu nilainya saat kompilasi,
//    maka gunakan `final` atau `late final` saja, bukan const.

// 2. Const constructor tetap bisa dipanggil tanpa `const`,
//    tapi objek yang dihasilkan bukan compile-time constant.

// Contoh:
var dinamis = Koordinat(
  10,
  20,
); // valid, tapi bukan const meski constructor-nya const

// 3. Const bisa digunakan sebagai annotation (misalnya di @override, @deprecated, dll)

// ==============================================
// Kesimpulan:
// ==============================================

// - Const constructor digunakan untuk membuat objek immutable dan konstan
// - Membantu optimasi performa dan penggunaan memori
// - Harus digunakan saat semua field class adalah final
// - Sangat berguna untuk data tetap dan deklaratif seperti UI widget Flutter
