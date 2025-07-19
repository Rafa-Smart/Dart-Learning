void main(){
  // https://chatgpt.com/c/687b4b06-ae20-8009-9ec9-19563f000b20
}

// Variable Shadowing adalah kondisi ketika sebuah variabel lokal
// (misalnya di dalam fungsi, blok if, loop, atau constructor)
// memiliki nama yang sama dengan variabel yang berada di luar blok tersebut,
// misalnya di class, di global scope, atau di parent scope.
//
// Akibatnya, variabel lokal tersebut akan "menutupi" (shadow)
// variabel yang berada di luar scope-nya.
// Variabel luar tetap ada, tetapi tidak bisa diakses secara langsung
// selama variabel lokal dengan nama yang sama berada di scope saat ini.

// ============================================
// Kenapa ini penting dipahami?
// ============================================
// - Shadowing bisa menyebabkan kebingungan jika tidak dipahami,
//   karena nilai variabel bisa berbeda tergantung scope.
// - Shadowing dapat digunakan secara sengaja untuk modifikasi nilai lokal
//   tanpa mengubah state di luar scope tersebut.
// - Namun, jika tidak digunakan hati-hati, bisa menyebabkan bug
//   atau hasil program yang tidak sesuai harapan.

// ============================================
// Contoh Kasus Shadowing di Dart:
// ============================================

String status = 'Aktif'; // variabel global

void cekStatus() {
  String status = 'Nonaktif'; // variabel lokal yang menutupi variabel global
  print(status); // Output: Nonaktif (yang digunakan adalah variabel lokal)
}

// void main() {
//   print(status); // Output: Aktif (mengakses variabel global)
//   cekStatus();   // Output: Nonaktif (shadowing terjadi di dalam fungsi)
// }

// ============================================
// Penjelasan:
// ============================================
// - Di fungsi `cekStatus`, terdapat variabel `status` baru yang
//   dideklarasikan ulang di dalam fungsi tersebut.
// - Meskipun di luar fungsi sudah ada variabel `status`,
//   yang digunakan adalah variabel lokal (dalam fungsi).
// - Variabel luar tertutup (shadowed) oleh variabel lokal.

// ============================================
// Shadowing dalam Constructor Class
// ============================================

class User {
  String? name;

  // Constructor parameter menggunakan nama yang sama: 'name'
  User(String name) {
    // name = name;   // ❌ Ini tidak mengubah field class karena dua 'name' menunjuk ke parameter
    this.name = name; // ✅ Yang kiri this.name adalah milik class, yang kanan adalah parameter
  }

  void printName() => print(name);
}

// void main() {
//   var user1 = User('Dani');
//   user1.printName(); // Output: Dani
// }

// ============================================
// Penjelasan:
// ============================================
// - Jika kita menulis `name = name;`, maka Dart akan menganggap
//   kedua 'name' adalah parameter lokal di constructor,
//   sehingga field class tidak akan pernah diisi (tetap null).
// - Dengan menggunakan `this.name`, kita menunjuk field dari class,
//   sedangkan `name` tanpa `this` menunjuk ke parameter.
// - Itulah contoh nyata variable shadowing yang umum terjadi di constructor.

// ============================================
// Shadowing dalam Scope Bersarang (Nested Scope)
// ============================================

void testNestedShadowing() {
  int angka = 5;

  if (true) {
    int angka = 10; // Menutupi variabel 'angka' sebelumnya
    print('Dalam if: $angka'); // Output: 10
  }

  print('Di luar if: $angka'); // Output: 5
}

// void main() {
//   testNestedShadowing();
// }

// ============================================
// Penjelasan:
// ============================================
// - Variabel `angka` dalam blok `if` hanya hidup di dalam blok itu saja.
// - Di luar blok `if`, nilai `angka` tetap 5 (yang ada di parent scope).
// - Ini contoh shadowing dalam nested scope: yang dalam menutupi yang luar.

// ============================================
// Kapan Harus dan Tidak Harus Menggunakan Shadowing?
// ============================================

// ✅ Shadowing boleh digunakan jika:
// - Ingin membatasi cakupan variabel agar hanya berlaku lokal.
// - Ingin menulis constructor dengan parameter bernama sama dengan field.
// - Ingin menghindari mutasi variabel luar.

// ❌ Shadowing sebaiknya dihindari jika:
// - Bisa menyebabkan kebingungan pembaca kode.
// - Tidak ada alasan kuat untuk membuat variabel lokal dengan nama yang sama.
// - Menyebabkan kesalahan saat mengisi field class atau global state.

// ============================================
// Tips untuk Menghindari Kesalahan:
// ============================================
// - Gunakan `this.` untuk mengakses field class jika ada shadowing.
// - Gunakan nama parameter berbeda jika ingin menghindari kebingungan.
// - Gunakan konvensi penamaan (misal: `_localName`) untuk membedakan lokal vs global.

// ============================================
// Contoh: Tanpa Shadowing (Lebih Aman Dibaca)

class Produk {
  String? nama;

  // Tanpa shadowing: gunakan nama parameter berbeda
  Produk(String namaInput) {
    nama = namaInput;
  }

  void show() => print(nama);
}

// ============================================
// Kesimpulan:
// ============================================
// - Variable shadowing terjadi saat variabel di scope dalam menutupi
//   variabel dengan nama sama di scope luar.
// - Ini bisa terjadi di fungsi, blok, constructor, atau class.
// - Gunakan dengan hati-hati agar kode tetap jelas dan mudah dirawat.
// - Pahami perbedaan `this.field` dan parameter lokal agar tidak terjadi bug.

