

// nih bacaaa

// 1. Field final atau yang tidak nullable dan tidak punya nilai default,
//    wajib diinisialisasi lewat initializer list atau inline saat deklarasi.
// 2. Initializer list tidak boleh menggunakan kode yang melibatkan 'this'.
//    Karena field belum diinisialisasi, jadi kita belum bisa mengakses objeknya.
// 3. Urutan inisialisasi:
//    - Initializer list dijalankan dulu
//    - Kemudian constructor body
// 4. Jika mewarisi class lain (extends), maka constructor parent (super) HARUS dipanggil
//    sebelum constructor body subclass, dan ini dilakukan di initializer list.


// 1. Untuk menginisialisasi field yang bersifat final (wajib diinisialisasi di awal).
// 2. Untuk melakukan perhitungan atau logika ringan SEBELUM constructor body dijalankan.
// 3. Untuk pemanggilan ke superclass constructor (inheritance).
// 4. Untuk inisialisasi efisien tanpa perlu pengulangan assignment di body constructor.


// buat class yg constructornya ada validasi

class Mahasiswa {
  late String nama_lengkap;
  late String nama_awal;
  late String nama_akhir;
  late int uang;

  // nah disni sebelum user memasuka uang ke constructornya
  // kita akn validasi di initializer listnya

  // jadi initializer list ini akan dieksekusi sebelum si constructor bodynya
  // jadi ga bisa akses this, karena belum dibuat objeknya

  // jadi nama disni itu mengacu pada field yaa, karea diluar scope, dan ga ke overide

  // jadi klo uangnya itu 0
  // maka kita akn kasih ia uang default yaitu 100

  Mahasiswa(String nama_full_param, int uangParam)
    : nama_lengkap = nama_full_param,
      this.uang = uangParam == 0 ? 100 : uangParam,
      nama_awal = nama_full_param.split(" ")[0],
      nama_akhir = nama_full_param.split(" ")[1]{
        print('objek sudah dibuat');
      }

}

void main() {

  // berhasil
  final Mahasiswa jamal = Mahasiswa('jamal istiqomah', 5000);
  print(jamal.uang); // 500
  print(jamal.nama_awal);
  print(jamal.nama_akhir);
  print('------------');
  final Mahasiswa siti = Mahasiswa('siti muhaimin', 0);
  print(siti.uang); // 100
  print(siti.nama_awal);
  print(siti.nama_akhir);

  var m1 = Mobil("Toyota", 2022);
  var m2 = DenganInitializer(99);
  var m3 = Perhitungan(8);
  var m4 = Pelajar("Dina", 17);
  var m5 = Produk.diskon("Buku");
  print(m1);
  print(m2);
  print(m3);
  print(m4);
  print(m5);
}



// Apa itu Initializer List?
// Initializer List adalah fitur dalam constructor (khususnya constructor dari class)
// yang memungkinkan kita menginisialisasi field (variabel anggota class) 
// sebelum body constructor dijalankan.

// Syntax-nya menggunakan tanda titik dua (:) setelah parameter constructor,
// lalu diikuti dengan daftar assignment ke field.

// ==============================================
// Kenapa Harus Menggunakan Initializer List?
// ==============================================

// 1. Untuk menginisialisasi field yang bersifat final (wajib diinisialisasi di awal).
// 2. Untuk melakukan perhitungan atau logika ringan SEBELUM constructor body dijalankan.
// 3. Untuk pemanggilan ke superclass constructor (inheritance).
// 4. Untuk inisialisasi efisien tanpa perlu pengulangan assignment di body constructor.

// ==============================================
// Contoh Sederhana: Tanpa Initializer List
// ==============================================

// class TanpaInitializer {
//   final int nilai;
  
//   // Constructor ini akan error karena `final` wajib diinisialisasi
//   // namun nilainya diberikan di body constructor, bukan saat inisialisasi awal.
//   TanpaInitializer(int x) {
//     // ERROR: Field final harus diinisialisasi di initializer list atau saat deklarasi
//     // this.nilai = x;
//   }
// }

// ==============================================
// Contoh Benar: Dengan Initializer List
// ==============================================

class DenganInitializer {
  final int nilai;

  // Constructor menggunakan initializer list (dengan titik dua)
  // Nilai diassign ke field sebelum body constructor dijalankan
  DenganInitializer(int x) : nilai = x {
    // Bagian ini adalah body constructor, dijalankan SETELAH nilai diassign
    print('Constructor dijalankan dengan nilai = $nilai');
  }
}

// ==============================================
// Initializer List dengan Lebih dari 1 Field
// ==============================================

class GandaField {
  final int angka1;
  final int angka2;

  // Bisa inisialisasi beberapa field sekaligus, pisahkan dengan koma
  GandaField(int a, int b) : angka1 = a, angka2 = b;
}

// ==============================================
// Initializer List dengan Ekspresi atau Perhitungan
// ==============================================

class Perhitungan {
  final int kuadrat;
  final int total;

  // Kita bisa melakukan operasi matematika langsung di initializer list
  Perhitungan(int angka)
      : kuadrat = angka * angka,
        total = angka + 100;
}

// ==============================================
// Initializer List vs Default Constructor Body
// ==============================================

// Di bawah ini contoh perbedaan penempatan logika antara initializer list dan constructor body

class Demo {
  final int nilai;
  
  // Nilai diinisialisasi langsung sebelum body constructor
  Demo(int x) : nilai = x {
    // Body constructor ini tidak bisa digunakan untuk inisialisasi final
    print('Nilai adalah $nilai');
  }
}

// ==============================================
// Initializer List dan Superclass
// ==============================================

class Orang {
  final String nama;
  Orang(this.nama);
}

class Pelajar extends Orang {
  final int umur;

  // Initializer list dapat digunakan untuk memanggil constructor superclass (Orang)
  // serta menginisialisasi field di subclass
  Pelajar(String nama, int umur) 
    : umur = umur,
      super(nama); // super(nama) harus dipanggil terakhir di initializer list
}

// ==============================================
// Initializer List dan Redirecting Constructor
// ==============================================

class Produk {
  final String nama;
  final int harga;

  // Constructor utama
  Produk(this.nama, this.harga);

  // Named constructor yang redirect ke constructor utama
  Produk.diskon(String nama) : this(nama, 5000); // redirect menggunakan initializer
}

// ==============================================
// Catatan Penting
// ==============================================

// 1. Field final atau yang tidak nullable dan tidak punya nilai default,
//    wajib diinisialisasi lewat initializer list atau inline saat deklarasi.
// 2. Initializer list tidak boleh menggunakan kode yang melibatkan 'this'.
//    Karena field belum diinisialisasi, jadi kita belum bisa mengakses objeknya.
// 3. Urutan inisialisasi:
//    - Initializer list dijalankan dulu
//    - Kemudian constructor body
// 4. Jika mewarisi class lain (extends), maka constructor parent (super) HARUS dipanggil
//    sebelum constructor body subclass, dan ini dilakukan di initializer list.
// 1. Untuk menginisialisasi field yang bersifat final (wajib diinisialisasi di awal).
// 2. Untuk melakukan perhitungan atau logika ringan SEBELUM constructor body dijalankan.
// 3. Untuk pemanggilan ke superclass constructor (inheritance).
// 4. Untuk inisialisasi efisien tanpa perlu pengulangan assignment di body constructor.

// ==============================================
// Contoh Lengkap Final
// ==============================================

class Mobil {
  final String merek;
  final int tahun;

  Mobil(String m, int t)
    : merek = m,
      tahun = t {
    print("Mobil $m keluaran tahun $t");
  }
}


