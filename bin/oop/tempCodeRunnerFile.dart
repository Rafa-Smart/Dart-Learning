// jadi kita bisa membaut operator method
// penjelasan https://chatgpt.com/c/687b1fa4-ed00-8009-a41f-d5d9634b97dd
// oke disini kita kan buat contoh lain
// https://chatgpt.com/c/687cdd78-09e8-8009-8b0b-3a127ad1a921
class Pembayaran {
  final int jml_uang;
  final String mata_uang;
  Pembayaran(this.jml_uang, this.mata_uang);

  // nah disni kita akan overide si operator +

  // Pembayaran operator +(int uang, int mata) {
  // yg atas ini ga bisa, karena hanya boleh masukin obj

  Pembayaran operator +(Pembayaran obj) {
    if (obj.mata_uang != this.mata_uang) {
      throw Exception('Mata Uang Tidak Sama');
    } else {
      return Pembayaran(obj.jml_uang + this.jml_uang, this.mata_uang);
    }
  }

  @override
  // String toString(){
  //   return 'Pembayaran: $this.jml_uang $this.mata_uang';
  // }
  String toString() {
    return 'Pembayaran: ${this.jml_uang} ${this.mata_uang}';
  }

  // ini akn jadi rekursif
  //   Karena kamu menuliskan $this.jml_uang, maka Dart akan memanggil toString() pada objek this. Tapi karena kamu sedang berada di dalam method toString() itu sendiri, maka akan terjadi pemanggilan rekursif tanpa akhir:
  // toString() dipanggil.
  // Di dalamnya kamu menggunakan $this, maka this.toString() dipanggil lagi.
  // Lalu itu akan memanggil toString() lagi, dan begitu seterusnya...
}

// ini default isi dari class Object
// class Object {
//   const Object();

//   String toString() => "Instance of '${runtimeType}'";
// }

// kita ga bisa overiding property, tapi bisa pake method get dan set
class Parent {
  String _name = "Parent";

  String get name => _name;
  set name(String value) => _name = value;
}

class Child extends Parent {
  @override
  String get name => "Child"; // ✅ Getter di-override

  @override
  set name(String value) {
    _name = "Child: $value"; // ✅ Setter di-override
  }
}

// void main() {
//   var child = Child();
//   print(child.name); // Output: "Child"
//   child.name = "New";
//   print(child.name); // Output: "Child: New"
// }

// Apa itu operator method?
// Operator method di Dart adalah fitur yang memungkinkan kita
// meng-*override* (menimpa) perilaku dari operator-operator standar
// seperti +, -, *, /, ==, [], [], dll pada class buatan kita sendiri.

// Artinya, kita bisa membuat object dari sebuah class
// berperilaku seperti angka, string, atau list,
// tergantung operator mana yang kita override.

// Misalnya, kamu ingin membuat class "Vector" yang bisa dijumlahkan dengan operator `+`,
// kamu bisa override operator `+` untuk mendefinisikan bagaimana dua objek `Vector` dijumlahkan.

// -----------------------------------------------------------------------------
// CONTOH SEDERHANA: Operator "+" ditambahkan pada class Vector
// -----------------------------------------------------------------------------

// Buat class Vector dua dimensi
class Vector {
  final int x;
  final int y;

  // Constructor untuk menginisialisasi nilai x dan y
  Vector(this.x, this.y);

  // Override operator "+"
  // Keyword "operator" digunakan untuk menandakan bahwa kita akan meng-override operator
  Vector operator +(Vector other) {
    // Penjumlahan vector dilakukan dengan menjumlahkan nilai x dan y masing-masing
    return Vector(this.x + other.x, this.y + other.y);
  }

  Vector operator -(Vector other) {
    // Penjumlahan vector dilakukan dengan menjumlahkan nilai x dan y masing-masing
    return Vector(this.x - other.x, this.y - other.y);
  }

  // Override operator "toString()" agar saat dicetak, hasilnya terbaca
  // jadi jika obj ini di print / di toString maka formatnya adalah ini

  // jadi ini bisa, karena kita secara default seluruh class itu instance obj dari
  // class Object, nah di Object ini dia punya method tostring()
  // makanya bisa kita everride
  @override
  String toString() => 'ini vectornya Vector($x, $y)';
}

// ini dilarang ya, di class yg sudah bawaan
// untuk melakukan overide operator di tipedata bawaan
// extension on int{
//   int operator +(int other){
//     return this + other;
//   }
// }

class Kali {
  final int x;
  Kali(this.x);

  int operator *(Kali other) {
    return this.x * other.x;
  }
}

class Bilangan {
  final int nilai;

  Bilangan(this.nilai);

  // Penjumlahan menggunakan operator +
  Bilangan operator +(Bilangan other) {
    return Bilangan(this.nilai + other.nilai);
  }

  // Pengurangan menggunakan operator -
  Bilangan operator -(Bilangan other) {
    return Bilangan(this.nilai - other.nilai);
  }

  // Perkalian menggunakan operator *
  Bilangan operator *(Bilangan other) {
    return Bilangan(this.nilai * other.nilai);
  }

  // Pembagian menggunakan operator /
  double operator /(Bilangan other) {
    return this.nilai / other.nilai;
  }

  // Pembagian bulat menggunakan ~/
  Bilangan operator ~/(Bilangan other) {
    return Bilangan(this.nilai ~/ other.nilai);
  }

  // Modulo menggunakan %
  Bilangan operator %(Bilangan other) {
    return Bilangan(this.nilai % other.nilai);
  }

  // Operator pembanding <
  bool operator <(Bilangan other) {
    return this.nilai < other.nilai;
  }

  // Operator pembanding >
  bool operator >(Bilangan other) {
    return this.nilai > other.nilai;
  }

  // Operator pembanding <=
  bool operator <=(Bilangan other) {
    return this.nilai <= other.nilai;
  }

  // Operator pembanding >=
  bool operator >=(Bilangan other) {
    return this.nilai >= other.nilai;
  }

  // Override == (wajib override hashCode juga)
  @override
  bool operator ==(Object other) {
    return other is Bilangan && this.nilai == other.nilai;
  }

  @override
  int get hashCode => nilai.hashCode;

  // Unary minus (contoh: -obj)
  Bilangan operator -() {
    return Bilangan(-this.nilai);
  }

  // Bitwise NOT (~obj)
  Bilangan operator ~() {
    return Bilangan(~this.nilai);
  }

  // Bitwise AND
  Bilangan operator &(Bilangan other) {
    return Bilangan(this.nilai & other.nilai);
  }

  // Bitwise OR
  Bilangan operator |(Bilangan other) {
    return Bilangan(this.nilai | other.nilai);
  }

  // Bitwise XOR
  Bilangan operator ^(Bilangan other) {
    return Bilangan(this.nilai ^ other.nilai);
  }

  // Bitwise Shift Left
  Bilangan operator <<(int shiftBy) {
    return Bilangan(this.nilai << shiftBy);
  }

  // Bitwise Shift Right
  Bilangan operator >>(int shiftBy) {
    return Bilangan(this.nilai >> shiftBy);
  }

  // toString agar mudah dibaca saat print()
  @override
  String toString() => 'Bilangan($nilai)';
}

// Class khusus untuk demonstrasi operator [] dan []=
class AngkaList {
  final List<int> _data = [];

  // Akses data seperti array
  int operator [](int index) => _data[index];

  // Set data seperti array
  void operator []=(int index, int value) {
    if (_data.length <= index) {
      _data.length = index + 1;
    }
    _data[index] = value;
  }

  @override
  String toString() => _data.toString();
}

void main() {
  // untuk testing bilangan
  final a = Bilangan(10);
  final b = Bilangan(4);

  print('a + b = ${a + b}'); // 14
  print('a - b = ${a - b}'); // 6
  print('a * b = ${a * b}'); // 40
  print('a / b = ${a / b}'); // 2.5
  print('a ~/ b = ${a ~/ b}'); // 2
  print('a % b = ${a % b}'); // 2

  print('a < b = ${a < b}'); // false
  print('a > b = ${a > b}'); // true
  print('a <= b = ${a <= b}'); // false
  print('a >= b = ${a >= b}'); // true
  print('a == Bilangan(10): ${a == Bilangan(10)}'); // true

  print('-a = ${-a}'); // -10
  print('~a = ${~a}'); // bitwise NOT dari 10
  print('a & b = ${a & b}'); // bitwise AND
  print('a | b = ${a | b}'); // bitwise OR
  print('a ^ b = ${a ^ b}'); // bitwise XOR
  print('a << 1 = ${a << 1}'); // 10 << 1 = 20
  print('a >> 1 = ${a >> 1}'); // 10 >> 1 = 5

  // Uji operator []
  final list = AngkaList();
  list[0] = 100;
  list[1] = 200;
  print('list[0] = ${list[0]}'); // 100
  print('list = $list'); // [100, 200]

  final data1 = Kali(5);
  final data2 = Kali(10);
  // nah kalo misalkan si class Kali ini ga punya method operator *
  // maka kita ga bisa emngkali sebuah objek
  print(data1 * data2); // Output: 50

  // gabisa
  List<int> pertama = [1, 2, 3];
  List<int> kedua = [1, 2, 3];
  final hasil2 = pertama + kedua;
  print(hasil2); // [1, 2, 3, 1, 2, 3]

  // pake pembayaran
  final obj1 = Pembayaran(15000, "idr");
  final obj2 = Pembayaran(10000, "idr");
  // kita igin menambahkan
  final hasil = obj1 + obj2;
  print(obj1);
  print(obj2);
  print(hasil); // Pembayaran: 25000 idr

  final v1 = Vector(2, 3);
  final v2 = Vector(4, 1);
  final result = v1 + v2; // memanggil operator method "+"
  print(result); // ini vectornya Vector(6, 4)

  final v3 = Vector(4, 8);
  final v4 = Vector(1, 3);
  final result2 = v3 - v4;
  print(result2); // ini vectornya Vector(3, 5)
  print(v2); // ini vectornya Vector(4, 1)
  print(v2.toString()); // ini vectornya Vector(4, 1)

  var child = Child();
  print(child.name); // Output: "Child"
  child.name = "New";
  print(child.name); // Output: "Child: New"

  // contoh yg dibawah
  final myList = MyList();
  myList[0] = 10;
  myList[1] = 20;
  print(myList[0]); // Output: 10
  print(myList[1]); // Output: 20
  print(myList[9] = 34);
  print(myList);
  print(myList[10] = 133);

  // karena index 10 ini ga ada, maka akn diisi dengan 0 sampai index ke 10
  // nah jadi tetep bisa, jadi ini tuh gini
  // karena index 10 ga ada maka dari index yg ada isinya
  // sampai index 10, diisi dulu sama 0
  // nah kao udah nyampe index 10, maka index 10 ini diisi dengan valuenya
  // gitu

  // nih cek index ke 5 harusnya 0
  print(myList[5]); // 0 -> benar
}

// -----------------------------------------------------------------------------
// DAFTAR OPERATOR YANG BISA DIOVERRIDE DI DART:
// -----------------------------------------------------------------------------

// Berikut daftar operator yang bisa dioverride di Dart (semua ini pakai kata kunci "operator"):
// +        (penjumlahan)
// -        (pengurangan atau unary minus)
// *        (perkalian)
// /        (pembagian hasil double)
// ~/       (pembagian bulat)
// %        (modulo atau sisa bagi)
// <, >, <=, >=  (operator perbandingan)
// ==       (pemeriksaan kesamaan)
// []       (index operator untuk akses)
// []=      (operator penetapan nilai pada index)
// unary-   (minus unary, contoh: -a)
// ~        (bitwise NOT)
// ^, &, |  (bitwise XOR, AND, OR)
// <<, >>   (bitwise shift left/right)

// -----------------------------------------------------------------------------
// CONTOH 2: Override operator "==" dan "hashCode"
// -----------------------------------------------------------------------------

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  // Override operator "=="
  @override
  bool operator ==(Object other) {
    // Periksa apakah objek lain adalah instance dari Person
    // lalu bandingkan berdasarkan nilai name dan age
    return other is Person && other.name == name && other.age == age;
  }

  // Jika override "==", WAJIB override "hashCode" juga
  @override
  int get hashCode => Object.hash(name, age);
}

void checkEquality() {
  final p1 = Person('Ali', 25);
  final p2 = Person('Ali', 25);
  final p3 = Person('Budi', 30);

  print(p1 == p2); // true
  print(p1 == p3); // false
}

// -----------------------------------------------------------------------------
// CONTOH 3: Operator Indexing dengan [] dan []=
// -----------------------------------------------------------------------------

class MyList {
  final List<int> _internal = [];

  // override operator untuk akses dengan index []
  int operator [](int index) => _internal[index];

  // override operator untuk mengisi nilai menggunakan []
  void operator []=(int index, int value) {
    // jika index melebihi panjang list, tambahkan null dulu
    while (_internal.length <= index) {
      _internal.add(0);
    }
    _internal[index] = value;
  }
}

void listDemo() {
  // final myList = MyList();
  // myList[0] = 10;
  // myList[1] = 20;
  // print(myList[0]); // Output: 10
  // print(myList[1]); // Output: 20
  // print(myList[9]);
}

// -----------------------------------------------------------------------------
// Kenapa menggunakan operator method?
// -----------------------------------------------------------------------------

// 1. Membuat class kamu lebih ekspresif dan mirip perilaku tipe bawaan (int, List, dll)
// 2. Kode lebih bersih dan mudah dibaca
// 3. Mendukung penggunaan notasi matematika yang familiar (misalnya vector, matrix)
// 4. Berguna saat membuat class yang perlu manipulasi data, seperti model matematis atau struktur data custom

// -----------------------------------------------------------------------------
// PENTING:
// -----------------------------------------------------------------------------

// - Tidak semua operator bisa dioverride (misalnya = tidak bisa dioverride)
// - Jangan sembarangan override operator, harus sesuai makna asli operator tsb agar kode tidak membingungkan
// - Jika override ==, maka wajib override hashCode agar objek bisa digunakan di Set/Map secara benar
// - Tidak bisa override operator ternary (?:) atau logical operator seperti &&, ||


// -----------------------------------------------------------------------------
// MENJADI LEBIH KUAT:
// -----------------------------------------------------------------------------

// Jika kamu ingin membuat custom class untuk model matematis seperti Complex Number, 
// Matrix, Fraction, DateRange, dll — maka penggunaan operator method ini sangat dianjurkan.

// Gunakan operator dengan tepat agar kode tetap mudah dibaca dan tidak membingungkan developer lain.



// test
// test
// test