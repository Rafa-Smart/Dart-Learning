import 'dart:typed_data';

class Parent {
  // disini kalo udah pake final
  // nanti ga bsia diganti lagi
  String nama = "parent";
  late int umur;

  // nah disni kita buat constructronya

  Parent(String namaParam, int umurParam) : nama = namaParam, umur = umurParam;

  void sayHi() {
    print('haloo ini dari parent');
  }
}

class Child extends Parent {
  late bool anak;

  final String nama = 'child';

  // disini kita buat constructor
  // sekaligus panggil parent constructor pake super

  // nah  jadi pas kita maggil super constructor ke parent
  // kita harus deklarasikan seluruh propertynya
  // di Childnya ini

  // nah ini tuh sama aja kayak kita redirecting ke constructor parent
  // nah biasanya kan kalo kita redirec ke constructor utama dlam class ini
  // kita ga bsia punya body, nah khusus untuk redirec super, kita bisa melakukannya punya bdy
  Child(String namaParam, int umurParam, bool isAnak)
    : anak = isAnak,
      super(namaParam, umurParam){
        print('child turunan parent');
      }

  // INGET
  // nah ketika gitu, maka otomatis, kita akn punya field
  // tetep sma seperti di parentnya yaitu nama dan umur
  // meskipun disini sudah kita ganti jadi namaParam dan umurParam

  // disini kita ingin overide sealigus mengakses
  // fungsi dari parent yg asli

  @override
  void sayHi() {
    print('haloo ini dari child');
    super.sayHi();
  }

  void akses() {
    print('ini dari child -> $nama');
    print('ini dari parent -> ${super.nama}');
  }
}

void main() {
  // jadi ketika kita menggunakn super untuk constructor
  // maka kita harus menaruh super ini di initializer list
  // agar bisa diakes constructor dari parent classnya
  final Child jamal = Child('jamal', 10, true);
  print(jamal.nama); // jamal
  jamal.sayHi();
  // haloo ini dari child
  // haloo ini dari parent

  jamal.akses();
  // ini dari child -> child
  // ini dari parent -> jamal
}

// super adalah keyword di Dart yang digunakan untuk merujuk ke superclass (kelas induk)
// dari sebuah subclass (kelas turunan). Keyword ini memungkinkan kita mengakses:
// - konstruktor superclass
// - method superclass
// - property (field/getter/setter) superclass

// Tujuan penggunaan super:
// 1. Mengakses method atau properti dari superclass yang di-*override*
// 2. Memanggil konstruktor dari superclass
// 3. Menghindari konflik nama antara subclass dan superclass

// =========================================================================
// CONTOH DASAR PENGGUNAAN `super` UNTUK MENGAKSES METHOD SUPERCLASS
// =========================================================================

class Kendaraan {
  void jalan() {
    print("Kendaraan sedang berjalan");
  }
}

class Mobil extends Kendaraan {
  @override
  void jalan() {
    print("Mobil mulai menyala");

    // Memanggil method jalan() dari superclass Kendaraan
    super.jalan();
  }
}

// void main() {
//   var avanza = Mobil();
//   avanza.jalan();
// }

// Output:
// Mobil mulai menyala
// Kendaraan sedang berjalan

// Penjelasan:
// - Method `jalan()` di subclass `Mobil` meng-*override* method di superclass `Kendaraan`
// - Namun kita masih bisa memanggil versi asli dari superclass dengan `super.jalan()`
// - Ini sangat berguna saat kita ingin memperluas perilaku method, bukan menggantikannya

// =========================================================================
// CONTOH `super` UNTUK MENGAKSES KONSTRUKTOR SUPERCLASS
// =========================================================================

class Manusia {
  String nama;
  Manusia(this.nama);
}

class Pelajar extends Manusia {
  String sekolah;

  // Gunakan `super` untuk memanggil konstruktor dari superclass Manusia
  Pelajar(String nama, this.sekolah) : super(nama);

  void info() {
    print("Nama: $nama, Sekolah: $sekolah");
  }
}

void main2() {
  var siswa = Pelajar("Rani", "SMA 1");
  siswa.info();
}

// Output:
// Nama: Rani, Sekolah: SMA 1

// Penjelasan:
// - super(nama) digunakan untuk mengisi nilai properti `nama` dari superclass `Manusia`
// - Ini wajib dilakukan jika superclass tidak punya default constructor (tanpa parameter)

// =========================================================================
// CONTOH `super` UNTUK MENGAKSES PROPERTY ATAU FIELD YANG TEROVERRIDE
// =========================================================================

class Hewan {
  String suara = "Tidak diketahui";

  void bersuara() {
    print("Hewan bersuara: $suara");
  }
}

class Kucing extends Hewan {
  String suara = "Meong";

  @override
  void bersuara() {
    print("Kucing bersuara: $suara");
    print("Suara dari superclass: ${super.suara}");
  }
}

void main3() {
  var pus = Kucing();
  pus.bersuara();
}

// Output:
// Kucing bersuara: Meong
// Suara dari superclass: Tidak diketahui

// Penjelasan:
// - Subclass `Kucing` mendefinisikan ulang properti `suara`
// - Untuk mengakses properti dari superclass `Hewan`, kita gunakan `super.suara`

// =========================================================================
// CATATAN TAMBAHAN DAN PENTING
// =========================================================================

// 1. `super` hanya dapat digunakan di dalam kelas yang mewarisi (extends) kelas lain
// 2. `super` tidak bisa digunakan di luar konteks kelas atau di luar turunan langsung
// 3. `super` hanya menunjuk ke superclass langsung, bukan ke parent di atasnya lagi (no multi-level)
// 4. Saat menggunakan named constructor, kita tetap bisa gunakan `super.namaKonstruktor()` jika diperlukan
// 5. `super` berguna dalam prinsip OOP seperti Polymorphism dan Code Reuse

// =========================================================================
// RANGKUMAN
// =========================================================================

// super digunakan untuk:
// - Memanggil method dari superclass yang sudah di-*override*
// - Mengakses field, property, atau getter dari superclass
// - Memanggil konstruktor superclass saat subclass butuh mewarisi nilai awal

// super berguna untuk:
// - Menghindari duplikasi kode
// - Menambah (bukan mengganti) perilaku superclass
// - Menjaga konsistensi pewarisan dan relasi antar class

// =========================================================================
