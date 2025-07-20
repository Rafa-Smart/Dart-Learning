

// jadi ktia bisa meggunakan get dan setter ini
// dn ini slah satu implementasi dari konsep encapsulasi

class Person {
  late String _nama;
  late int _gaji;
  double _pajak = 0.5;

  Person({required String namaParam, required int gajiParam})
    // : _nama = namaParam,
    //   _umur = umurParam;
    // jadi kalo pake private ini ga bisa di akses di initializer list

    // ini di initializer listnya kita cek si gaji
    // pas pertama kali dibuat

    {
      this._nama = namaParam;
      this._gaji = gajiParam;
    }

  // disini kita buat implementasi nya

  String get nama => _nama;

  // bisa jga gini jadi pake, body

  double get gaji {
    return _gaji * _pajak;
  }

  // ini untk setternya
  // ini untuk nama
  void set nama(valuebaru){
    // jadi kao ada dan tidak string kosong value barunya
    if(valuebaru != null && valuebaru != ""){
      _nama = valuebaru;
      print(_nama);
    }
  }
  // ini untuk gaji
  void set gaji(valuebaru){
    // jadi kalo ada, tidak string kosong dan tidak 0 value barunya

    // jadi cara cek apakah dia itu ada, ga bis pake ini ya
    // if(valuebaru){}
    // tapi pake 
    if(valuebaru != null && valuebaru != "" && valuebaru != 0){
      _gaji = valuebaru;
      print(_gaji);
    }
  }

}

// https://chatgpt.com/c/687ce416-be38-8009-a35c-a52e34be6eae

void main() {

  final jamal = Person(namaParam: "jamal", gajiParam: 9000);
  // jamal._gaji = 9; error ->
  // LateInitializationError: Field '_gaji@20313068' has already been initialized.
  // makanya kita ga jadi pake final, diatasnya / classnya

  // jadi errronya itu pas dijalankan, karena final itu pas dijalankannya
  // ga boleh diubah ubha

  // nah stetlah ktia ganti agr tidak final lagi
  // disini kit bisa mengubahnya

  print(jamal.nama);
  print(jamal.gaji);
  jamal.gaji = 9000;
  jamal.nama = 'jamal mantap';


print('=============');

  // * membuat objek dari class Siswa
  var siswa = Siswa();

  // * menggunakan setter (tanpa tanda kurung)
  siswa.nama = 'Budi'; // ini memanggil set nama()

  // * menggunakan getter (tanpa tanda kurung)
  print(siswa.nama); // ini memanggil get nama()
}


// * Getter dan Setter adalah method khusus dalam OOP (Object-Oriented Programming)
// * yang digunakan untuk mengakses (getter) dan mengubah (setter) nilai dari properti (field) suatu objek.

// * Meskipun field bisa dibuat `public` agar bisa langsung diakses,
// * penggunaan getter dan setter memberikan kontrol yang lebih baik dan menjaga prinsip enkapsulasi.

// * Di Dart, kita bisa membuat getter dan setter secara eksplisit untuk
// * mengatur bagaimana nilai suatu properti dibaca dan diubah.

// * FORMAT UMUM:
// * getter:    Tipe get nama => ekspresi;
// * setter:    set nama(Tipe value) { ... }

// * Contoh 1: Getter dan Setter Sederhana
class Siswa {
  // * field private (_nama) hanya bisa diakses dalam class ini
  String _nama = '';

  // * getter untuk membaca nilai dari _nama
  String get nama => _nama;

  // * setter untuk mengubah nilai dari _nama
  set nama(String value) {
    // * validasi: nama tidak boleh kosong
    if (value.isEmpty) {
      throw ArgumentError('Nama tidak boleh kosong');
    }
    _nama = value;
  }
}

// * Penjelasan:
// * 1. Field _nama disembunyikan dari luar class dengan menambahkan _ (underscore), yang artinya private di Dart.
// * 2. Kita menyediakan akses ke field tersebut melalui getter dan setter.
// * 3. Ini memungkinkan kita menambahkan logika tambahan saat membaca atau mengubah nilai.

// * Kenapa Harus Pakai Getter dan Setter?
// * - Enkapsulasi: Menyembunyikan detail implementasi field internal.
// * - Validasi: Bisa menolak nilai yang tidak valid (seperti nama kosong).
// * - Fleksibilitas: Bisa mengubah implementasi internal tanpa mengubah interface publik.
// * - Read-only property: Getter tanpa setter menjadikan field hanya bisa dibaca.

// * Contoh 2: Properti Hanya Bisa Dibaca (getter-only)
class Produk {
  final double harga;

  Produk(this.harga);

  // * hanya menyediakan getter, tanpa setter
  double get diskon => harga * 0.1;
}

void main2() {
  var produk = Produk(20000);
  print('Diskon: ${produk.diskon}'); // getter-only
  // produk.diskon = 1000; // Error! Tidak bisa di-set
}

// * Contoh 3: Setter dengan logika tambahan
class Pegawai {
  int _gaji = 0;

  // * getter
  int get gaji => _gaji;

  // * setter dengan logika validasi
  set gaji(int nilai) {
    if (nilai < 1000) {
      throw Exception('Gaji terlalu kecil');
    }
    _gaji = nilai;
  }
}

void main3() {
  var pegawai = Pegawai();
  pegawai.gaji = 5000; // setter dipanggil
  print(pegawai.gaji); // getter dipanggil
}

// * Catatan Tambahan:
// * - Getter dan Setter bisa didefinisikan juga di interface / abstract class
// * - Getter dan setter bisa dibuat menggunakan => (expression body) atau dengan block {}
// * - Getter tidak memiliki parameter, sedangkan setter menerima satu parameter bernama bebas (umumnya 'value')

// * Kesimpulan:
// * Getter dan Setter adalah cara elegan untuk mengontrol akses ke field objek dalam Dart.
// * Mereka memberikan keamanan, validasi, dan fleksibilitas dibandingkan akses langsung.
// * Dart mendukung syntax yang ringkas dan intuitif untuk getter/setter, membuatnya sangat natural digunakan.
