// JADI DI DART, GA BISA ABSTRACT PROPERTY / FIELD
// https://chatgpt.com/c/687ccde4-39d4-8009-b117-32cc8a059b21

// jadi kalo implements itu, sama kayak intreface
// jadi harus deklarasi ulang semuanya,
// kalo extends / abstract itu tidak harus di deklarasikan semua
// hanya yg method yg absctract saja

// jaid abstract ini sama aja kayak konsep abstract yg ada di typescript
// tapi saja di dart itu ga bsia pake keyword abstract pada methodnya

// jadi kalo ada method yang hanya di deklarasika saja
// maka itu artinya dia adalah method yg abstract

// dan di dart ini ga ada interface, jadinya hanya bisa menggunakan abstract class saja
// karena di dart itu class itu merupakan serbuah inteerface juga secara tidak langsung
// karena bsia di implements
// dan bisa juga sebagai tipe data

abstract class Person {
  // nah ini itu ga di abtract
  // tapi akan di turunkan
  late String? nama;
  late int? umur;
  // nah jaid siapapun yg extends atau implements class ini
  // maka wajib punya kedua field ini

  // buat method abstract
  void sayhello();

  // buat method yang bisa diturunkan juga
  void sayHelloAll() {
    print('Halo semua');
  }
}

class User extends Person {
  // String? nama;
  // int? umur;

  // User(String name, int umur)
  //   :nama = name,
  //    umur = umur;

  // nah jadi sebenernya kalo ga pake field juga bisa
  // karena sudah extnds

  // tapi kao mau buat lagi juga ga papa
  // nah jadi this.nama ini dari si parentnya

  // dan kita disini ga bisa pake super constructor, karena diparetnya itu ga ada
  // constructor
  User(String namaParam, int umurParamm) {
    this.nama = namaParam;
    this.umur = umurParamm;
  }
  void sayhello() {
    print('haloo ini dari child nama $nama, umur $umur');
  }
}

void main() {
  final Person jamal = User("jamal", 70);
  jamal.sayhello();
  jamal.sayHelloAll();
  print(jamal.nama);
  print(jamal.umur);

  // haloo ini dari child nama jamal, umur 70
  // Halo semua
  // jamal
  // 70
}


// Dalam bahasa Dart, `abstract` adalah kata kunci (keyword) yang digunakan
// untuk mendeklarasikan class yang tidak dapat diinstansiasi langsung.
// Maksudnya, kita tidak bisa membuat objek dari class abstract secara langsung.

// Class abstract biasanya digunakan sebagai **kerangka dasar (blueprint)**
// yang hanya mendefinisikan struktur umum dari suatu class,
// tetapi tidak memberikan implementasi konkrit pada semua anggotanya.

// Kita bisa membuat class lain (subclass/turunan) yang akan meng-override
// dan memberikan implementasi dari method-method yang sudah dideklarasikan
// di dalam class abstract tersebut.


// Kenapa harus menggunakan abstract?
// ----------------------------------
// 1. Untuk membuat struktur umum yang dapat dipakai banyak class turunannya.
// 2. Memastikan bahwa class turunannya **wajib mengimplementasikan method tertentu**.
// 3. Untuk menerapkan prinsip **Polymorphism** dan **Inheritence** dalam OOP.
// 4. Untuk memisahkan antara deklarasi dan implementasi (separation of concern).


// Bagaimana cara kerjanya?
// -------------------------
// - Class yang diberi kata kunci `abstract` tidak bisa dibuat objeknya langsung.
// - Biasanya berisi method-method yang tidak memiliki body (hanya deklarasi saja).
// - Method tanpa body itu disebut `abstract method` (meski di Dart tidak ada keyword khusus untuk abstract method).
// - Method tanpa body akan otomatis membuat class menjadi abstract jika tidak diimplementasikan.

// Syntax dasar:
// -------------
// abstract class NamaClass {
//   void method();  // deklarasi method tanpa body
// }


// CONTOH 1: Penerapan dasar abstract class di Dart
// ------------------------------------------------

/*
// abstract class tidak bisa diinstansiasi langsung
abstract class Hewan {
  // Method tanpa implementasi: wajib dioverride oleh turunan
  void suara();

  // Method biasa bisa juga disediakan
  void bernafas() {
    print('Hewan bernafas...');
  }
}

// class turunan wajib override method abstract
class Anjing extends Hewan {
  @override
  void suara() {
    print('Guk guk!');
  }
}

void main() {
  // var hewan = Hewan(); // ERROR: abstract class tidak bisa dibuat objeknya
  var dog = Anjing();
  dog.suara();      // Output: Guk guk!
  dog.bernafas();   // Output: Hewan bernafas...
}
*/


// Penjelasan baris per baris:
// ---------------------------
// - abstract class Hewan --> class yang menjadi template dan tidak bisa dipakai langsung.
// - void suara();         --> method abstrak, tidak memiliki isi, wajib dioverride.
// - void bernafas()       --> method biasa, bisa langsung digunakan oleh class turunan.
// - class Anjing extends Hewan --> class turunan yang harus mengimplementasikan `suara()`.


// CONTOH 2: Abstract class sebagai kontrak untuk berbagai bentuk turunan
// ----------------------------------------------------------------------

/*
abstract class Kendaraan {
  void nyalakanMesin();
  void matikanMesin();
}

class Mobil extends Kendaraan {
  @override
  void nyalakanMesin() {
    print("Mesin mobil dinyalakan");
  }

  @override
  void matikanMesin() {
    print("Mesin mobil dimatikan");
  }
}

class Motor extends Kendaraan {
  @override
  void nyalakanMesin() {
    print("Mesin motor dinyalakan");
  }

  @override
  void matikanMesin() {
    print("Mesin motor dimatikan");
  }
}

void main() {
  Kendaraan kendaraan1 = Mobil();
  kendaraan1.nyalakanMesin();  // Output: Mesin mobil dinyalakan
  kendaraan1.matikanMesin();   // Output: Mesin mobil dimatikan

  Kendaraan kendaraan2 = Motor();
  kendaraan2.nyalakanMesin();  // Output: Mesin motor dinyalakan
  kendaraan2.matikanMesin();   // Output: Mesin motor dimatikan
}
*/


// Manfaat Abstract Class dibanding Interface di Dart:
// ----------------------------------------------------
// Di Dart, `interface` secara teknis tidak memiliki keyword tersendiri seperti di Java.
// Semua class bisa bertindak sebagai interface.
// Tapi jika kamu hanya ingin membuat kerangka dasar dan menyediakan beberapa implementasi,
// maka `abstract class` adalah pilihan ideal.

// Abstract class:
// - Bisa memiliki implementasi sebagian
// - Bisa memiliki properti
// - Bisa punya konstruktor
// - Hanya bisa mewarisi 1 abstract class (single inheritance)

// Interface (menggunakan class biasa):
// - Semua method harus diimplementasikan ulang
// - Bisa mengimplementasi banyak interface sekaligus (multiple interface)


// Kesimpulan:
// -----------
// Gunakan `abstract class` jika:
// - Kamu ingin membuat blueprint dengan beberapa default behavior
// - Kamu ingin menghindari instansiasi langsung terhadap class dasar
// - Kamu ingin memastikan semua class turunan memiliki method wajib tertentu

// Jangan gunakan `abstract class` jika:
// - Kamu ingin langsung membuat objek dari class tersebut
// - Kamu tidak perlu struktur hirarki inheritance
