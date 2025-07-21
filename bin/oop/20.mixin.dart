// jadi karena kita ga bisa extends lebih dari satu,
// maka kita bisa melakukan yang namanya mixin, jadi kita tempelkan
// method / ptoperty kedalam sebuah class tanpa inheritance / impelement

// cara buat mixin itu gampang
// dan dia ga punya constructor ya
mixin Hewan {
  final String hewan = "kucing";
  void suaraHewan(){
    print('ini suara hewan');
  }
}

mixin Tumbuhan {
  final String tumbuhan = "rose";
  void suaraTumbuhan(){
    print('ini suara tumbuhan');
  }
}


class Person {
  late final String orang;
  Person(String namaParam)
    :orang = namaParam{
      print('oran sudah dibuat');
    }

    void suaraOrang(){
      print('ini suara orang');
    }
}


class Makhluk extends Person with Tumbuhan, Hewan {
  // disini kita perlu constructor ya
  // karena parent kita yg person itu punya cosntructor
  // jadi harus kita paggil

  Makhluk(String namaParam)
    :super(namaParam);

}





void main() {

  // disini kita bisa panggil semua method yang ada di class Makhluk

  Makhluk jamal = Makhluk("jamal");
  jamal.suaraTumbuhan();
  jamal.suaraHewan();
  jamal.suaraOrang();



  var elang = BurungTerbang();
  elang.makan(); // Output: Burung makan biji-bijian
  elang.terbang(); // Output: Aku bisa terbang!

  var bebek = Bebek();
  bebek.makan(); // Output: Burung makan biji-bijian
  bebek.berenang(); // Output: Aku bisa berenang!
  bebek.terbang(); // Output: Aku bisa terbang!
  bebek.bersuara(); // Output: Kwek kwek
}

// * Mixin adalah cara untuk menambahkan kemampuan (method dan property) ke dalam class
// * tanpa perlu menggunakan pewarisan (inheritance) tunggal seperti `extends`.
// * Mixin bukan class, melainkan kumpulan method/properti yang dapat "ditempelkan" ke class lain.
// * Ini mirip seperti mewarisi method secara horizontal.

// * MENGAPA MENGGUNAKAN MIXIN?
// * - Dart tidak mendukung multiple inheritance (tidak bisa `extends` lebih dari satu class)
// * - Tapi kita bisa menggunakan beberapa mixin untuk menambahkan banyak perilaku
// * - Lebih fleksibel dan modular
// * - Cocok untuk reusability (menghindari duplikasi kode)

// * CARA MEMBUAT DAN MENGGUNAKAN MIXIN:
// * - Gunakan keyword `mixin`
// * - Untuk menggunakan mixin, pakai keyword `with`
// * - Class yang memakai mixin bisa mengakses semua method di dalam mixin

// * CONTOH SEDERHANA MIXIN:
mixin Terbang {
  void terbang() {
    print("Aku bisa terbang!");
  }
}

mixin Berenang {
  void berenang() {
    print("Aku bisa berenang!");
  }
}

class Burung {
  void makan() {
    print("Burung makan biji-bijian");
  }
}

// * Menambahkan kemampuan mixin ke class Burung
class BurungTerbang extends Burung with Terbang {}

class Bebek extends Burung with Terbang, Berenang {
  void bersuara() {
    print("Kwek kwek");
  }
}

// * PENJELASAN:
// * Class `BurungTerbang` hanya dapat satu pewarisan dari `Burung`, tetapi bisa dapat banyak perilaku dari mixin.
// * Class `Bebek` menggunakan 2 mixin: `Terbang` dan `Berenang`

// * SYARAT PENGGUNAAN MIXIN:
// * Sebuah mixin tidak boleh memiliki constructor (karena tidak bisa diinisialisasi)
// * Mixin tidak bisa digunakan jika butuh inisialisasi objek atau memiliki state kompleks

// * MIXIN DENGAN CONSTRAINT (BATASAN):
// * Kadang kita ingin mixin hanya bisa dipakai oleh class tertentu
// * Gunakan keyword `on` untuk membatasi siapa yang bisa menggunakan mixin

class Mamalia {
  void menyusui() {
    print("Mamalia menyusui");
  }
}

mixin Berbulu on Mamalia {
  void bulu() {
    print("Aku punya bulu halus");
  }
}

// * Class ini valid karena Mamalia adalah superclass-nya
class Kucing extends Mamalia with Berbulu {}

// * Tapi class ini akan error jika bukan turunan Mamalia
// class Komodo with Berbulu {} // ERROR

void testConstraint() {
  var kucing = Kucing();
  kucing.menyusui(); // Output: Mamalia menyusui
  kucing.bulu(); // Output: Aku punya bulu halus
}

// * PERBEDAAN MIXIN VS INHERITANCE VS INTERFACE:
// * - `extends`: pewarisan class tunggal, bisa wariskan field dan implementasi
// * - `implements`: mewarisi kontrak, wajib override semua
// * - `mixin`: menempelkan method/properti ke class lain tanpa pewarisan formal

// * KEGUNAAN MIXIN DI INDUSTRI:
// * - Modularisasi: pisahkan fitur-fitur reusable ke dalam mixin (misalnya Logger, Validator, Serialization)
// * - Menghindari duplikasi method
// * - Digunakan di Flutter untuk fitur-fitur UI (seperti TickerProviderStateMixin, SingleTickerProviderStateMixin)

// * CONTOH REAL USECASE DI FLUTTER:
// * class MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin { ... }
// * - digunakan untuk membuat animation controller

// * CATATAN AKHIR:
// * - Mixins adalah fitur powerful untuk komposisi perilaku
// * - Bisa digunakan sebanyak mungkin mixin dalam 1 class
// * - Harus dihindari menyimpan state kompleks dalam mixin
// * - Hindari konflik nama method antar mixin

// * KESIMPULAN:
// * Mixin adalah cara reusable untuk menambahkan method ke class lain
// * Meningkatkan fleksibilitas dan modularitas kode
// * Mixins membantu mengatasi keterbatasan inheritance tunggal di Dart
// * Harus digunakan secara bijak dan konsisten
