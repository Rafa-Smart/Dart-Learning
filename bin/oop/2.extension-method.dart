  // oke disini saya akn menambahkan fungsi palindrom ke dalam class string
  // agar bisa diakses di objk instancenya
  // jadi hanya bisa di top level ya

// Dart hanya mengizinkan kita menambahkan:
// 1.Method (fungsi)
// 2.Getter
// 3.Setter
// TAPI tidak bisa menyimpan state tambahan (field/properti).

  extension NambahPalindrom on String {
    // nama extension ini bebas
    bool isPalindrom(){
      return this.replaceAll(" ", "") == this.replaceAll(" ", "").split("").reversed.join("");
    }
  }

  // kita juga bisa buat extension tanpa nama
  // tapi hanya bisa diakses di file ini saja
  // jadi kalo di file lain, maka ga akan ada extensionya

  // karena defaultnya, klo pake nama maka
  // Extension hanya terlihat di file atau package yang mengimpornya

  extension on String{
    bool isPalindrom2(){
      // return this.replaceAll(" ", "") == this.replaceAll(" ", "").split("").reversed.join("");

      // sebenarnya ga harus pake this, jadi bisa gini
      return replaceAll(" ", "") == replaceAll(" ", "").split("").reversed.join("");
    }
  }



void main(){
  // jai ktia bisa daftarkan lagi method kesebuah class
  // https://chatgpt.com/c/687af581-a4f8-8009-a3eb-373747f8947e

  // jdai simplenya, ketikakita buat extension method kesebuah class
  // ita sebenarnya tidak memberikan mehtod ini secara lnagsng
  // tapi di balik layar, Dart tidak benar-benar menambahkan method sayHi() ke class 
  // String. Ini hanya syntactic sugar — Dart tahu bahwa ada extension MyExtension yang 
  // aktif di scope tersebut untuk String, jadi saat kamu tulis 'John'.sayHi(), Dart 
  // otomatis melakukan redirect ke extension-nya.


  // nah disnii ktia tes
  const data = "jamal";
  print(data.isPalindrom()); // false

  const datapalindrom = "kasur rusak";
  print(datapalindrom.isPalindrom()); // true
  


  const palin2 = "dsdsds";
  print(palin2.isPalindrom2()); // false








// Extension method adalah fitur di Dart yang memungkinkan kita
// untuk menambahkan method, getter, atau setter ke kelas yang sudah ada
// tanpa perlu mengubah definisi asli kelas tersebut atau membuat subclass.

// Dengan extension, kita bisa "memperluas" fungsionalitas dari tipe data 
// apapun, termasuk tipe primitif, class bawaan, atau class buatan sendiri.

// Extension method mulai diperkenalkan di Dart 2.7

// ---------------------------------------
// ALASAN PENGGUNAAN EXTENSION METHOD
// ---------------------------------------
// 1. Menambahkan fungsionalitas ke class pihak ketiga (misal: class bawaan Dart atau package eksternal)
// 2. Menjaga kode tetap bersih tanpa harus membuat subclass
// 3. Dapat membuat API yang lebih deklaratif dan mudah dibaca
// 4. Mempercepat produktivitas dengan menambahkan utilitas tambahan

// ---------------------------------------
// CARA MENDEFINISIKAN EXTENSION METHOD
// ---------------------------------------
// Struktur dasarnya:
// extension NamaExtension on TipeTarget {
//   returnType namaMethod(parameter) {
//     // implementasi
//   }
// }

// ---------------------------------------
// CONTOH 1: Extension pada String
// ---------------------------------------

// Kita ingin menambahkan method isPalindrome() pada String
// extension StringExtension on String {
//   bool isPalindrome() {
//     // Menghilangkan spasi dan mengubah ke huruf kecil
//     final normalized = this.replaceAll(' ', '').toLowerCase();
//     // Bandingkan dengan versi terbalik
//     return normalized == normalized.split('').reversed.join('');
//   }
// }

// Penggunaan:
// void main() {
//   print('Kasur rusak'.isPalindrome()); // true
//   print('Hello'.isPalindrome());       // false
// }

// ---------------------------------------
// CONTOH 2: Extension pada int
// ---------------------------------------

// Kita ingin menambahkan method isEvenDanKelipatan5() ke int
// extension IntegerCheck on int {
//   bool isEvenDanKelipatan5() {
//     return this % 2 == 0 && this % 5 == 0;
//   }
// }

// Penggunaan:
// void main() {
//   print(10.isEvenDanKelipatan5()); // true
//   print(6.isEvenDanKelipatan5());  // false
// }

// ---------------------------------------
// CONTOH 3: Extension dengan Getter dan Setter
// ---------------------------------------

// Menambahkan getter 'doubleValue' dan setter 'safeValue'
// extension DoubleUtil on double {
//   double get doubleValue => this * 2;

//   // Setter tidak bisa mengubah nilai original, tapi bisa dipakai untuk validasi
//   set safeValue(double val) {
//     if (val.isNegative) {
//       print('Nilai negatif tidak diizinkan');
//     } else {
//       print('Nilai valid: $val');
//     }
//   }
// }

// Penggunaan:
// void main() {
//   double x = 5.5;
//   print(x.doubleValue); // 11.0
//   x.safeValue = -2;     // Nilai negatif tidak diizinkan
//   x.safeValue = 3;      // Nilai valid: 3
// }

// ---------------------------------------
// CONTOH 4: Extension pada List<T>
// ---------------------------------------

// Kita ingin menambahkan method sum() pada List<int>
// extension ListIntExtension on List<int> {
//   int sum() => this.fold(0, (prev, element) => prev + element);
// }

// Penggunaan:
// void main() {
//   List<int> angka = [1, 2, 3, 4];
//   print(angka.sum()); // 10
// }

// ---------------------------------------
// PENAMAAN DAN KONFLIK EXTENSION
// ---------------------------------------
// - Extension dapat diberi nama atau tidak.
// - Jika ada dua extension dengan method yang sama, Dart akan error kecuali kita resolve secara eksplisit.
// - Contoh resolve eksplisit:
//     MyExtension(obj).myMethod();

// ---------------------------------------
// EXTENSION ANONYMOUS (TANPA NAMA)
// ---------------------------------------
// Bisa juga tanpa nama jika hanya digunakan dalam satu file
// Contoh:
// extension on String {
//   String toCapital() => this[0].toUpperCase() + this.substring(1);
// }

// Penggunaan:
// void main() {
//   print('hello'.toCapital()); // Hello
// }

// ---------------------------------------
// KELEBIHAN EXTENSION METHOD
// ---------------------------------------
// - Tidak perlu mengubah class asli
// - Dapat digunakan untuk menambah API
// - Cocok untuk utility method

// ---------------------------------------
// KEKURANGAN EXTENSION METHOD
// ---------------------------------------
// - Tidak bisa mengakses private member dari class asli
// - Jika konflik method, perlu resolve manual
// - Tidak sefleksibel inheritance untuk override behavior

// ---------------------------------------
// KAPAN HARUS MENGGUNAKAN EXTENSION METHOD?
// ---------------------------------------
// - Saat ingin menambahkan method helper pada class yang tidak bisa kita ubah
// - Saat ingin membuat API yang deklaratif
// - Saat tidak ingin menggunakan inheritance
// - Saat membuat library helper atau utilitas yang sering dipakai

// ---------------------------------------
// CATATAN PENTING
// ---------------------------------------
// - Extension hanya terlihat di file atau package yang mengimpornya
// - Tidak menggantikan inheritance, tapi sebagai pelengkap
// - Baiknya digunakan secara bijak agar tidak membuat konflik

// =======================================
// PENUTUP
// =======================================
// Extension method adalah fitur powerful di Dart yang memungkinkan kita
// memperluas class tanpa merusak kode asli. Dengan pemahaman yang benar,
// extension dapat membuat kode lebih modular, bersih, dan efisien.



}