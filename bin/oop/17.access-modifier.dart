
// jaid di dart itu ga punya protected
// jadi tetep bisa diakses meskipun di child classnya kalo private
// dan tetap bisa diubah dimanapun itu, jika 1 file yg sama

// tan tetap bsia diubah diluar classnya
// https://chatgpt.com/c/687cdd78-09e8-8009-8b0b-3a127ad1a921

class ParentPrivate{
  late String _nama;
}

class Child extends ParentPrivate {

  
  // Child(String namaParam)
  //   :this._nama = namaParam;{
  //   print('membuat child class pake nama $_nama');
  // }

  // nah kalo di initializer list, kita ga bisa akses private proeprty / field
  // yang ada di parent classnya

  // tapi bisa kita akses kalo di body constructronya
  Child(String namaParam){
    this._nama = namaParam;
    print("child class sudah dibuat $_nama");
  }
}


void main(){
    final Child jamal = Child("jamal");
    // ketika di lakukan yg diatas
    // otomatis akan dijalamkan printnya
    // child class sudah dibuat jamal
    // karen constructor akna dijalankan ketika diinisasi

    final ParentPrivate siti = Child("siti")
      .._nama = "tapi boong";
      // nah pas dibuat itu -> child class sudah dibuat siti
      // jadi namanya masih siti, tapi kalo kita baca lagi
      print(siti._nama); // tapi boong

      siti._nama = "boong lagi";
      print(siti._nama); // boong lagi
}


// Access Modifier (modifikator akses) adalah cara untuk 
// mengatur tingkat *aksesibilitas* terhadap variabel, method, 
// class, atau konstruktor, agar bisa dibatasi penggunaannya 
// hanya di tempat tertentu (misalnya dalam file, dalam class, dll).

// Dalam bahasa seperti Java/C++, access modifier ada banyak: 
// public, private, protected, dll.
// Namun DART hanya memiliki dua access modifier utama, yaitu:
//   - public (default, bisa diakses dari mana saja)
//   - private (menggunakan awalan _underscore, hanya bisa diakses 
//              dari file yang sama)

// -------------------------------------------------------------------
// KENAPA HARUS MENGGUNAKAN ACCESS MODIFIER?
// -------------------------------------------------------------------
// 1. Agar kode lebih AMAN, TERBATAS, dan TERTUTUP (encapsulation).
// 2. Untuk menjaga agar internal logic/class tidak bisa diakses 
//    sembarangan dari luar file.
// 3. Untuk membedakan antara API internal vs eksternal (misalnya 
//    dalam library atau framework).
// 4. Membuat kode lebih maintainable (mudah dirawat).

// -------------------------------------------------------------------
// BAGAIMANA CARA KERJANYA DI DART?
// -------------------------------------------------------------------
// Dart hanya memiliki satu mekanisme: jika nama variable, method,
// atau class diawali dengan underscore (_), maka item tersebut
// menjadi PRIVATE (hanya bisa diakses dalam file yang sama).

// Jika tidak memakai underscore, maka bersifat PUBLIC.

// -------------------------------------------------------------------
// CONTOH PENERAPAN PRIVATE DAN PUBLIC
// -------------------------------------------------------------------

class Person {
  // ini bersifat PUBLIC karena tidak diawali dengan underscore
  String name;

  // ini bersifat PRIVATE karena diawali dengan underscore
  int _age;

  // constructor
  Person(this.name, this._age);

  // PUBLIC method
  void sayHello() {
    print("Halo, saya $name");
  }

  // PRIVATE method
  void _saySecret() {
    print("Umur saya $_age, tapi ini rahasia!");
  }

  // PUBLIC method yang mengakses method private
  void reveal() {
    _saySecret(); // masih bisa dipanggil di dalam file/class ini
  }
}

// -------------------------------------------------------------------
// CONTOH PENGGUNAAN DARI FILE LAIN
// Misal file ini bernama: person.dart
// Lalu kita ingin mengakses class Person dari file lain
// -------------------------------------------------------------------

// import 'person.dart';

// void main() {
//   var p = Person('Rafa', 21);

//   print(p.name);       // ✅ BISA, karena 'name' itu public
//   print(p._age);       // ❌ ERROR, karena '_age' itu private
//   p.sayHello();        // ✅ BISA
//   p._saySecret();      // ❌ ERROR, method private
//   p.reveal();          // ✅ BISA, karena 'reveal' itu public
// }

// -------------------------------------------------------------------
// APA SAJA YANG BISA DISET SEBAGAI PRIVATE DI DART?
// -------------------------------------------------------------------
// ✔ Variable
// ✔ Method
// ✔ Constructor
// ✔ Class (walau jarang, tapi class bisa juga dibuat private)
// ✔ Getter/Setter

// -------------------------------------------------------------------
// CONTOH PRIVATE CONSTRUCTOR
// -------------------------------------------------------------------
class Singleton {
  // static instance
  static final Singleton _instance = Singleton._internal();

  // private constructor
  Singleton._internal();

  // factory method untuk akses satu-satunya instance
  factory Singleton() {
    return _instance;
  }

  void show() => print("Ini Singleton!");
}

// Singleton s = Singleton(); ✅ bisa diakses lewat factory
// Tapi tidak bisa dibuat dengan: Singleton._internal(); ❌

// -------------------------------------------------------------------
// CONTOH PRIVATE CLASS
// -------------------------------------------------------------------
class _Helper {
  static void help() {
    print("Ini dari helper private");
  }
}

// jika file ini diimport dari luar, maka class _Helper tidak bisa
// diakses karena dia bersifat PRIVATE

// -------------------------------------------------------------------
// PERBANDINGAN ACCESS MODIFIER DART VS BAHASA LAIN
// -------------------------------------------------------------------
// | Bahasa    | Public | Private | Protected | Internal |
// |-----------|--------|---------|-----------|----------|
// | Dart      | ✅     | ✅ (_)  | ❌        | ❌       |
// | Java      | ✅     | ✅      | ✅        | ✅       |
// | C++       | ✅     | ✅      | ✅        | ❌       |
// | C#        | ✅     | ✅      | ✅        | ✅       |

// Dart hanya mengenal PUBLIC dan PRIVATE berbasis file, bukan class.
// Tidak ada keyword 'private', hanya menggunakan _underscore.

// -------------------------------------------------------------------
// KELEBIHAN DAN KEKURANGAN PENERAPAN INI DI DART
// -------------------------------------------------------------------
// ✅ Lebih sederhana karena tidak banyak keyword
// ✅ Cocok untuk pemula dan maintainability
// ❌ Kurang fleksibel untuk kasus kompleks (tidak ada protected)
// ❌ Hanya berbasis file, bukan class/instance

// -------------------------------------------------------------------
// PENUTUP
// -------------------------------------------------------------------
// Jadi, Access Modifier di Dart itu sangat sederhana namun efektif.
// Kita hanya perlu paham aturan sederhana:
//   - Tambahkan _underscore untuk membuat sesuatu bersifat private
//   - Jika tidak, maka itu dianggap public
// Penggunaan yang tepat akan menjaga program tetap bersih, aman, 
// dan mudah dikembangkan.

