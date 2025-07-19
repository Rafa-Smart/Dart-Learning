class Test {
  // https://chatgpt.com/c/687b027c-7888-8009-9bb6-bced7391b62d
  void method1() {
    print('ini method 1');
    print(this);
  }

  void method2() => print(this); // hanya bisa satu statement / expresion

  // ini namanya anonymous function
  // ini ga bisa ya, karena ini itu kayak kita punya property yg isinya itu adalah method
  // void method3 = (){
  //   return 4;
  // };

  // kalo mau seperti ini

  void Function() method3 = () {
    // nah disni ktia ga bisa akses thisnya
    // karena fungsi ini
    // print(this); -> ga bisa
    // kaena diluar dari blok si Test ini, jadi ga bisa akses
    print('ini method 3');
  };

  // nah jadi seluruh contoh diatas ini, functionnya akna masuk di prototype / di clasnya
  // dan tidak aknamasuk ke instance objeknya

  // tapi kita juga bisa masukin fungsinya kesetiap objek instancenya
  // tapi ini boros memory, tapi bsia

  // nih declare untuk si function yg akan langsung masuk ke objek
  // Karena semua properti instance harus dideklarasikan terlebih dahulu di dalam
  // class, baru bisa diisi nilainya di dalam constructor.
  void Function()? sayHi2; // kita buat nullable -> bisa null

  // Atau
  late void Function() sayHi3; // harus dipastikan diisi sebelum dipakai

  // karena kalo declare itu kan nanti diisinya, makanya ini berati boleh nulllable

  Test() {
    // nah disni kita masukan fungsinya
    // yang lansung nempel di objeknya

    // ini ga bisa yaa, karena di belum dideklarasikan
    // jadi ga mask ke objeknya, kalo mau mendingan deklarasikan dlu
    // atau buat fungsinya di luar constructor, tapi di classnya

    // jaid fungsi ini ga akan, bisa digunakan lewat si objeknya
    satHi() {
      print('haloooo');
      // Itu bukan properti class, tapi hanya variabel lokal dalam constructor, yang
      // akan hilang setelah constructor selesai. Jadi tidak bisa diakses dari luar
      // seperti jamal.sayHi().
    }

    // atau bisa juga pake anonymous, tapi harus di declare dulu diatas
    // yaitu di classnya, (ini kan constrctornya)

    // kalo gini, malah buat vriabe local baru
    // bukan implementasi
    // void sayHi2 = () {
    //   // print(this);
    //   print("ini adalah sayHI2");
    // };

    // void sayHi3 = () {
    //   // print(this); 
    //   print("ini adalah sayHI3");
    // };

    // ini baru implemetasi

    sayHi2 = () {
      print(this);
      print('halooo ini sayHi2');
    };
    sayHi3 = () => {
      print(this) // Instance of 'Test'
      // print('haloo ini sayHi3') ga bisa karena ini adalah function expresion
      // jadi hanya 1 expresi saja dan ga apke ;
    };
  }
}

void main() {
  Test jamal = Test();
  jamal.method3();
  jamal.sayHi2!();
  jamal.sayHi3();

  print("--------");
  // jadi kesimpulannya, kao di dart, itu seluruh fungsi akan ditaruh di
  // instance objeknya, mau bagaimana pun car penulisannya
  // dan thisnya juga akan selalu merujuk ke objek instance bagaimana pun cara penulisannya

  var e1 = Example1('Rafa');
  e1.sayHello(); // Hello from Rafa

  var e2 = Example2(42);
  e2.showNumber(); // Number is 42

  Example3.info(); // Static method

  var e4 = Example4();
  e4.name = 'Updated';
  print(e4.name); // Updated

  var e6 = Example6();
  e6.run(); // Running from anonymous function

  var e7 = Example7.named('Named');

  var e8 = Example8();
  e8.normalMethod(); // Normal: MyTitle
  e8.arrowMethod(); // Arrow: MyTitle
  e8.functionExpression(); // Inner: MyTitle

  var t = DartThis();
  t.test(); // Hello from Dart
}

// Dart adalah bahasa berorientasi objek, dan method adalah bagian penting dari class.
// Ada beberapa cara penulisan method dalam class Dart:
// - Method instance biasa
// - Method instance dengan arrow syntax
// - Method statis (static method)
// - Getter dan setter sebagai method akses
// - Method privat (dengan _underscore)
// - Named method (method tambahan di constructor)
// - Anonymous method (closure sebagai property)

// ===================================
// 1. Method Instance Biasa
// ===================================
class Example1 {
  String name;

  Example1(this.name);

  void sayHello() {
    print('Hello from $name');
    print(this.name); // this mengacu ke objek saat ini (instance ini)
  }
}

// ===================================
// 2. Method dengan Arrow Syntax (=>)
// Sama seperti function biasa, tapi singkat
// ===================================
class Example2 {
  int number;

  Example2(this.number);

  void showNumber() => print('Number is $number');
  // Sama saja dengan:
  // void showNumber() {
  //   print('Number is $number');
  // }
}

// ===================================
// 3. Static Method
// Tidak membutuhkan instance, tidak bisa pakai `this`
// ===================================
class Example3 {
  static void info() {
    print('This is static. No this here.');
    // print(this); ❌ ERROR: `this` tidak bisa digunakan di static method
  }
}

// ===================================
// 4. Getter dan Setter sebagai Method
// Disimpan di memory seperti method, dipanggil seperti properti
// ===================================
class Example4 {
  String _name = 'default';

  String get name => _name; // getter

  set name(String newName) => _name = newName; // setter
}

// ===================================
// 5. Method Privat
// Gunakan prefix underscore _ (hanya bisa diakses di library/file yang sama)
// ===================================
class Example5 {
  void _secretMethod() {
    print('This is a private method');
  }
}

// ===================================
// 6. Method Anonymous Disimpan di Property
// Sangat jarang, tapi legal secara sintaksis
// ===================================
class Example6 {
  late Function run;

  Example6() {
    run = () {
      print('Running from anonymous function');
    };
  }
}

// ===================================
// 7. Method dengan Named Constructor
// Bukan method biasa, tapi sering disalahpahami
// ===================================
class Example7 {
  String name;

  Example7(this.name);

  Example7.named(this.name) {
    print('Named constructor dipanggil');
  }
}

// ===================================
// 8. Arrow Method Expression dan `this`
// ===================================
class Example8 {
  String title = 'MyTitle';

  void normalMethod() {
    print('Normal: $title');
    print('Normal this: ${this.title}');
  }

  void arrowMethod() => print('Arrow: $title');
  // Sama seperti:
  // void arrowMethod() {
  //   print('Arrow: $title');
  // }

  void functionExpression() {
    var inner = () {
      print('Inner: $title');
      print('Inner this: ${this.title}');
    };
    inner(); // `this` tetap mengacu ke instance
  }
}

// ===================================
// PERILAKU `this` DI DART:
// ===================================

// - Berbeda dengan JavaScript, di Dart `this` **tidak berubah**
// - `this` di Dart SELALU mengacu pada instance class, bahkan di closure/function expression
// - Ini karena Dart tidak bergantung pada "context binding" seperti `call()`, `bind()`, atau `apply()` di JS

// Contoh: (JS-style error tidak berlaku di Dart)

class DartThis {
  String name = 'Dart';

  void test() {
    var inner = () {
      print('Hello from ${this.name}'); // this tetap mengacu ke instance
    };
    inner();
  }
}

// Di JavaScript, jika kamu pisahkan method dan panggil di luar objeknya, `this` akan undefined atau global.
// Tapi di Dart, closure dan method tetap punya akses ke `this` selama masih dalam scope class.



// ===================
// KESIMPULAN BESAR
// ===================

// - Ada banyak bentuk method di Dart, mulai dari instance, static, arrow, getter, setter, sampai closure
// - `this` di Dart stabil: selalu mengacu ke instance class saat ini
// - Arrow syntax hanya gaya penulisan, tidak mengubah binding `this` seperti di JavaScript
// - Tidak ada perubahan konteks otomatis seperti JS; Dart bersifat lexically scoped
// - Method ditulis di dalam class, dan semua instance berbagi referensi method tersebut
// - Static method hanya bisa akses data static, tidak bisa `this`



