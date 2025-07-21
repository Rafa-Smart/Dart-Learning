// jadi karena karena kita ga bisa abstract property / field
// makanya kita harus pake implements, jaid kita akna mmebaut abstract class
// atau class biasa menjadi interface, jadi ketika ad class yg implement ke class tersebut
// maka seluruh proprety  method wajib di deklarasi dan di override ulang

// dan ini juga bisa multiple interface, jadi tinggal pake koma aja

// ini contoh yang multiple

abstract class Parent1 {
  void sayHiParent1() {
    print('haloo dari Parent');
  }

  void sayHelloParent1();
}

class Parent2 {
  void sayHiParent2() {
    print('haloo ini dari parent 2');
  }
}

class User implements Parent1, Parent2 {
  @override
  void sayHiParent1() {
    print('haloo ini dari user');
  }

  @override
  void sayHelloParent1() {
    print('ini dari user juga');
  }

  @override
  void sayHiParent2() {
    print('haloo ini dari parent 2');
    // print('ini dari parent: ${super.sayHiParent2()}');
    // ga bisa, jadi ga bsa pake super kalo dari parent yg abstract
  }
}

void main() {
  Kendaraan kendaraan1 = Mobil();
  Kendaraan kendaraan2 = Motor();

  kendaraan1.maju(); // Output: Mobil maju
  kendaraan2.maju(); // Output: Motor jalan ke depan
}

// * Interface dalam Dart adalah sebuah kontrak (perjanjian) yang menyatakan bahwa
// * sebuah class harus mengimplementasikan semua properti dan method yang didefinisikan oleh interface tersebut.
// * Meskipun Dart tidak memiliki keyword khusus `interface`, namun semua class secara otomatis bisa menjadi interface.
// * Dart menggunakan class sebagai interface, dan untuk menerapkannya kita menggunakan keyword `implements`.

// * MENGAPA HARUS MENGGUNAKAN INTERFACE?
// * - Untuk menjamin bahwa class-class yang berbeda memiliki perilaku (method/properti) yang seragam
// * - Memisahkan definisi (kontrak) dari implementasi
// * - Meningkatkan fleksibilitas kode (polymorphism antar class yang berbeda)
// * - Cocok digunakan untuk dependency injection dan arsitektur berbasis abstraksi

// * CARA MENGGUNAKAN INTERFACE DI DART
// * Dart tidak butuh keyword `interface`, cukup buat class biasa lalu gunakan `implements`
// * Ketika sebuah class meng-implements interface, ia WAJIB meng-override SEMUA method dan property-nya

// * CONTOH SEDERHANA:
abstract class Kendaraan {
  void maju(); // * method abstrak
  void mundur(); // * method abstrak
}

// * Di atas adalah interface yang berupa abstract class
// * Bisa juga class non-abstract digunakan sebagai interface

class Mobil implements Kendaraan {
  // * Wajib override semua method
  void maju() {
    print("Mobil maju");
  }

  void mundur() {
    print("Mobil mundur");
  }
}

class Motor implements Kendaraan {
  void maju() {
    print("Motor jalan ke depan");
  }

  void mundur() {
    print("Motor mundur perlahan");
  }
}

// * CONTOH PENGGUNAAN

// * PENJELASAN:
// * Interface tidak bisa memiliki implementasi method (kecuali via default class)
// * Tujuannya hanya mendefinisikan kontrak: method apa yang harus dimiliki
// * Class yang mengimplementasi interface bisa punya implementasi yang berbeda-beda

// * BISA INTERFACE DARI MULTIPLE CLASS
// * Dart mendukung multiple interface (multi inheritance melalui interface)

class KendaraanTerbang {
  void terbang() => print("Terbang di udara");
}

class KendaraanLaut {
  void berenang() => print("Melaju di laut");
}

class Amphibi implements KendaraanTerbang, KendaraanLaut {
  void terbang() {
    print("Amphibi terbang rendah");
  }

  void berenang() {
    print("Amphibi menyusuri air");
  }
}

// * CONTOH PENGGUNAAN MULTI INTERFACE
void tesAmphibi() {
  Amphibi a = Amphibi();
  a.terbang(); // Output: Amphibi terbang rendah
  a.berenang(); // Output: Amphibi menyusuri air
}

// * CATATAN PENTING:
// * implements ≠ extends
// * - `extends`: mewarisi class dan bisa mewarisi implementasi
// * - `implements`: mengadopsi interface dan wajib implementasi semua ulang (tanpa mewarisi isi)

// * INTERFACE DENGAN PROPERTY
abstract class Hewan {
  String? nama;
  void suara();
}

class Kucing implements Hewan {
  String? nama = "Kucing Persia";

  void suara() {
    print("Meong");
  }
}

// * Ini akan error jika kita tidak override semua property & method dari interface Hewan

// * INTERFACE VS ABSTRACT CLASS
// * - Interface tidak menyimpan implementasi, hanya kontrak
// * - Abstract class bisa punya implementasi default
// * - Interface tidak bisa membuat constructor, abstract class bisa
// * - Gunakan abstract class jika kamu ingin ada sebagian implementasi default
// * - Gunakan interface (via `implements`) jika ingin memaksa class lain mengikuti struktur tertentu

// * KEGUNAAN INTERFACE DI INDUSTRI
// * - Digunakan untuk membuat kode modular dan loosely coupled
// * - Cocok untuk dependency injection: kita hanya tergantung pada kontrak (interface), bukan implementasi langsung
// * - Memudahkan testing karena bisa buat mock berdasarkan interface
// * - Digunakan pada arsitektur seperti Clean Architecture, SOLID principles (terutama Interface Segregation Principle)

// * KESIMPULAN:
// * Interface di Dart ditulis menggunakan class + `implements`
// * Digunakan untuk menjamin konsistensi antar class yang berbeda
// * Class yang mengimplementasi interface harus mengoverride semua property dan method
// * Interface memungkinkan pemisahan kontrak dan implementasi => membuat program lebih scalable dan maintainable
