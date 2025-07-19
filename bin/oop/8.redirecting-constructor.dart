
// jadi ini adalah proses inisialisasi dari
// named constuctor ke constuctor utama

// jadi maksud this ini, dianggap mengaakses default ocntructor
// yaitu consturor yg hanya menggunakan namaclassnya

class Person {
  late String nama;
  late int umur;
  late String kerja;
  late String kelas;

  // ini default
  Person(nama, umur, kerja){
    this.nama = nama;
    this.umur = umur;
  }


  // ini yang redirec 1
  // nah itu bisa pake nama default
  // Person.karyawan(String kerja) :this("Rafa", 17);

  // atau juga bisa, jadi kita dari user
  // Person.karyawan(String this.kerja) :this("Rafa", 16);
  // yg atas error, karena ga boleh ada this di paramnya
  // Redirecting constructor tidak memiliki body, jadi tidak bisa 
  //mengatur field secara langsung.

  // jadi ini tuh gini, si Person.It ini kayak buat constructor baru
  // padahal dia melanjutkan ke construcctor utamanya

  Person.It(String kerja):this("rafa", 16, kerja);

  // ini yag redirec 2
  Person.Pns(String Kerja) : this("siti", 14, Kerja);

  @override
  String toString(){
    return 'obj $nama telah dibuat';
  }
}

// atau bisa juga kita buat constucto yg beda beda

class Orang {
  late String nama;
  late int umur;
  late String kelas;
  late String kerja;

  // disni constructor 1
  // jadi buat orang biasa
  Orang(this.nama, this.umur);

  Orang.karyawan(nama, umur, kerja){
    this.nama = nama;
    this.umur = umur;
    this.kerja = kerja;
  }

  Orang.siswa(this.nama, this.umur, this.kelas);

  @override
  String toString(){
    return 'objek $nama telah dibuat';
  }

}




void main(){

  final Orang org1 = Orang("jamal", 15);
  final Orang org2 = Orang.karyawan("rafa", 16, "engineer");
  final Orang org3 = Orang.siswa("siti", 18, "Guru");
  print(org1);
  print(org2);
  print(org3);




  final Person person1 = Person("jamal", 15, "karyawan");
  final Person person2 = Person.It("engineer");
  final Person person3 = Person.Pns("Guru");

  print(person1);
  print(person3);
  print(person2);

}

// Redirecting constructor adalah fitur di Dart yang memungkinkan
// satu constructor mengarahkan (redirect) proses inisialisasinya
// ke constructor lain dalam kelas yang sama.
// Dengan kata lain, constructor A akan memanggil constructor B
// sebagai gantinya, dan tidak punya isi implementasi sendiri.


// Redirecting constructor menggunakan sintaks:
// NamaConstructor.namaLain() : this.namaConstructorUtama(args);
// Penjelasan:
// - `this.namaConstructorUtama(args)` berarti:
//   constructor ini tidak akan menginisialisasi sendiri,
//   melainkan meneruskan nilai ke constructor `namaConstructorUtama`.
// - Tidak boleh ada body/isi dalam constructor redirect (tidak boleh pakai {})

// =======================================================================
// KENAPA HARUS MENGGUNAKAN REDIRECTING CONSTRUCTOR?
// -----------------------------------------------------------------------
// - Menghindari duplikasi kode inisialisasi antar constructor.
// - Lebih efisien dan mudah dibaca.
// - Sangat berguna saat ada beberapa cara inisialisasi objek,
//   tapi semua harus bermuara ke satu sumber utama.
// - Praktik yang baik (clean code) dalam pemrograman OOP.

// =======================================================================
// CONTOH PENGGUNAAN REDIRECTING CONSTRUCTOR DI DART
// -----------------------------------------------------------------------

/*
class User {
  String name;
  int age;

  // Constructor utama
  User(this.name, this.age);

  // Redirecting constructor 1
  User.guest() : this('Guest', 0);

  // Redirecting constructor 2
  User.empty() : this('', 0);

  // Redirecting constructor 3
  User.named(String nameOnly) : this(nameOnly, 18);
}
*/

// Penjelasan per baris:
// class User { ... } → mendefinisikan sebuah class bernama `User`
// String name; int age; → dua field di class ini
// User(this.name, this.age); → constructor utama yang menerima nama dan umur

// Redirecting constructor User.guest()
// - Tidak memiliki body, hanya redirect ke constructor utama
// - Memberikan nilai default: name = 'Guest', age = 0

// Redirecting constructor User.empty()
// - Juga redirect ke constructor utama, tapi dengan nilai kosong dan 0

// Redirecting constructor User.named(String nameOnly)
// - Hanya menerima nama, dan mengisi age dengan default 18
// - Ini membuat cara pemanggilan constructor jadi fleksibel

// =======================================================================
// IMPLEMENTASI: CONTOH PENGGUNAAN
// -----------------------------------------------------------------------

/*
void main() {
  var user1 = User('Rafa', 22);       // menggunakan constructor utama
  var user2 = User.guest();           // menggunakan redirect ke 'Guest', 0
  var user3 = User.empty();           // menggunakan redirect ke '', 0
  var user4 = User.named('Khadafi');  // menggunakan redirect ke 'Khadafi', 18

  print(user1.name); // Rafa
  print(user2.name); // Guest
  print(user3.age);  // 0
  print(user4.age);  // 18
}
*/

// =======================================================================
// CATATAN PENTING:
// -----------------------------------------------------------------------
// - Redirecting constructor HARUS memanggil constructor dari class yang sama
// - Redirecting constructor TIDAK BOLEH punya body (tidak bisa pakai '{}')
// - Bisa digunakan untuk named constructor
// - Memperjelas niat kode saat ada banyak cara instansiasi
// - Bisa digunakan juga untuk factory constructor jika digabungkan

// =======================================================================
// VERSI KOMBINASI: NAMED CONSTRUCTOR + REDIRECT + VALIDASI
// -----------------------------------------------------------------------

/*
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  Product.free() : this('Sample', 0.0);

  Product.expensive(String name) : this(name, 9999.99);
}
*/

// =======================================================================
// RANGKUMAN:
// -----------------------------------------------------------------------
// Redirecting constructor = constructor yang mengarahkan ke constructor lain
// Tujuannya untuk:
// - Mengurangi duplikasi kode
// - Menyatukan logika inisialisasi
// - Membuat code lebih rapi dan mudah dipelihara

// Format:
// NamaConstructor.namaLain(...) : this.constructorUtama(...);

// Syarat:
// - Tidak boleh memiliki body
// - Harus mengarah ke constructor di class yang sama
// - Boleh digunakan untuk inisialisasi default, atau nilai tetap
