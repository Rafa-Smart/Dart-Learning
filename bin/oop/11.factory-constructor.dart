

// oke disini kita akan buat kasusnyata
// jdi dapat data json dari user,
// dan kita akn buat objek dari user terseut berdasarkan rolenya  
// {
//   "id": 101,
//   "name": "Rafa",
//   "role": "admin"
// }

abstract class User {
  final int id;
  final String nama;
  const User({required this.id, required this.nama});
  void sayHi();
}


class Admin extends User{

  Admin(int idParam, String namaParam)
     : super(id: idParam, nama:namaParam);
  void sayHi() => print('objek admin $nama sudah dibuat');
}

class Guest extends User{

  Guest(int idParam, String namaParam)
     : super(id: idParam, nama:namaParam);
  void sayHi() => print('objek guest $nama sudah dibuat');
}

// nah disini ktia buat factorynya
class UserFactory {
  static User create(data){
    // final String dataNama = data.nama;
    // final int dataId = data.id;
    // final String dataRole = data.role;

  // yg atas itu ga bisa, karena dia adalah map, jadi harus pake
  // ['data']


    final String dataNama = data['nama'];
    final int dataId = data['id'];
    final String dataRole = data['role'];

    if(dataRole.toLowerCase() == 'admin'){
      return Admin(dataId, dataNama);
    }else if(dataRole.toLowerCase() == 'guest'){
      return Guest(dataId, dataNama);
    }else {
      throw ArgumentError("role tidak ditemukan.");
    }
  }
}


void main() {

  // Simulasi data JSON dari backend
  Map<String, dynamic> json1 = {
    "id": 1,
    "nama": "Rafa",
    "role": "admin"
  };

  Map<String, dynamic> json2 = {
    "id": 2,
    "nama": "Fahmi",
    "role": "guest"
  };

  // Buat objek dari factory constructor
  User user1 = UserFactory.create(json1);
  User user2 = UserFactory.create(json2);

  user1.sayHi(); // objek admin Rafa sudah dibuat
  user2.sayHi(); // objek admin Fahmi sudah dibuat
  
  Shape s1 = ShapeFactory.create('circle');
  Shape s2 = ShapeFactory.create('square');

  s1.draw(); // * Output: Menggambar lingkaran
  s2.draw(); // * Output: Menggambar persegi
  // https://chatgpt.com/c/687c526c-cf9c-8009-8359-a49d363eb887
  // JADI SIMPLENYA DENGAN FACTORY CONSTRUCTOR
  // KTIA BSIA MELAKUAKN RETURN DI CONSTRUCTORNYA

  // jadi dnegna adanya factory cnstructor ini ktia bisa mereturn kan
  // objek

  // karna sebelumnya pada constructor kita ga bisa return

  // nah di factory ini kita bisa return
  // jdi bisa lebih flexible,
  // kita bis return objek yang sma, seperti yang sebelumnya
  // pernah dibuat, agar efesiensi memory,dll
}

// Penjelasan lengkap tentang factory constructor di Dart
// Ditulis sebagai komentar berbahasa Indonesia untuk membantu pemahaman

// * Factory constructor adalah jenis constructor khusus di Dart
// * yang digunakan untuk mengembalikan instance dari class,
//   tetapi tidak harus *selalu* membuat instance baru.
// * Artinya, factory constructor boleh:
//   - mengembalikan objek baru (seperti constructor biasa)
//   - atau mengembalikan objek yang sudah ada (reuse instance)
// * Ini sangat berguna jika kita ingin:
//   - mengontrol pembuatan objek
//   - menerapkan caching atau singleton pattern
//   - mengembalikan subclass dari class induk

// =========================================
// CIRI-CIRI FACTORY CONSTRUCTOR
// =========================================
// * Dideklarasikan dengan kata kunci `factory` sebelum nama constructor
// * Tidak bisa menggunakan initializer list (`:`) di dalamnya
// * Bisa mengembalikan instance dari tipe lain selama sesuai dengan tipe return
// * Bisa menjalankan logika kompleks sebelum membuat atau mengembalikan objek

// =========================================
// CONTOH SEDERHANA: CACHING DENGAN FACTORY
// =========================================

class User2 {
  final String username;
  static final Map<String, User2> _cache =
      {}; // * Cache untuk menyimpan objek User

  // * Constructor biasa (private) untuk membuat instance baru
  User2._internal(this.username);

  // * Factory constructor mengontrol logika pembuatan objek
  factory User2(String username) {
    // * Jika username sudah ada di cache, kembalikan instance yang sama
    if (_cache.containsKey(username)) {
      return _cache[username]!;
    }

    // * Jika belum ada, buat objek baru dan simpan ke cache
    final user = User2._internal(username);
    _cache[username] = user;
    return user;
  }
}

// =========================================
// PEMAKAIAN:
// =========================================

// void main() {
//   final user1 = User("rafa");
//   final user2 = User("rafa");

//   print(identical(user1, user2)); // * Output: true, karena factory mengembalikan instance yang sama
// }

// =========================================
// MENGAPA MENGGUNAKAN FACTORY CONSTRUCTOR?
// =========================================
// * Mengontrol cara objek dibuat
// * Dapat melakukan validasi, transformasi data, atau caching
// * Menerapkan pola desain (design pattern) seperti Singleton, Factory Method, dll
// * Mengembalikan subclass yang berbeda tergantung input

// =========================================
// CONTOH: FACTORY UNTUK SUBCLASS
// =========================================

abstract class Shape {
  void draw();
}

class Circle extends Shape {
  void draw() => print("Menggambar lingkaran");
}

class Square extends Shape {
  void draw() => print("Menggambar persegi");
}

class ShapeFactory {
  // Jika kamu memang ingin ShapeFactory itu mengembalikan dirinya sendiri, misalnya dalam
  // konteks singleton atau caching, contohnya
  // factory ShapeFactory(String type) {
  //   if (type == 'circle') return Circle();
  //   if (type == 'square') return Square();
  //   throw ArgumentError('Tipe tidak dikenal');
  // }

  // ga bisa karena kita mengembalikan tipe ShapeFactory, tapi didalam nya
  // kita return Circle / Square

  // solusinya ktia mendingan mneggunakan fungsi, dari pada factory
  // karena actory ini berfungsi ketika returnkan dirinya sendiri

  // nah jadi dia return Shape, yang merupakan abstrack class dari circle dan juga
  // square
  static Shape create(String type) {
    if (type == 'circle') return Circle();
    if (type == 'square') return Square();
    throw ArgumentError('Tipe tidak dikenal');
  }
}

// void main() {
//   Shape s1 = ShapeFactory('circle');
//   Shape s2 = ShapeFactory('square');

//   s1.draw(); // * Output: Menggambar lingkaran
//   s2.draw(); // * Output: Menggambar persegi
// }

// =========================================
// PERBANDINGAN DENGAN CONSTRUCTOR BIASA
// =========================================
// Constructor biasa:
// * Selalu membuat objek baru
// * Tidak bisa mengembalikan objek yang sudah ada
// * Harus langsung menginisialisasi field melalui initializer list

// Factory constructor:
// * Bisa mengembalikan objek baru atau lama
// * Bisa mengembalikan objek dari subclass
// * Bisa punya logika kompleks (if, switch, cache, validasi)

// =========================================
// PENGGUNAAN UMUM DALAM PRAKTIK
// =========================================
// * Implementasi Singleton (hanya satu instance seumur program)
// * Parsing JSON untuk memutuskan tipe objek yang dikembalikan
// * Membuat objek berdasarkan kondisi dinamis (runtime)
// * Mengurangi overhead dengan menggunakan cache (reuse object)

// =========================================
// CONTOH SINGKAT SINGLETON DENGAN FACTORY
// =========================================

class Logger {
  static final Logger _instance = Logger._internal(); // * Objek tunggal

  Logger._internal(); // * Constructor private

  factory Logger() =>
      _instance; // * Factory yang selalu kembalikan objek tunggal

  void log(String msg) => print("Log: $msg");
}

// void main() {
//   var l1 = Logger();
//   var l2 = Logger();

//   print(identical(l1, l2)); // * Output: true
//   l1.log("Hello world");
// }

// =========================================
// RINGKASAN
// =========================================
// * Gunakan factory constructor saat:
//   - Butuh logika saat membuat objek
//   - Perlu mengembalikan objek yang sudah ada (caching)
//   - Mengontrol instance yang dihasilkan
//   - Ingin menerapkan pola desain tertentu
// * Hindari factory jika:
//   - Tidak ada logika tambahan yang diperlukan
//   - Cukup dengan constructor biasa
