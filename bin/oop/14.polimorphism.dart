// jadi polimorphism ini sama aja konsepnya kayak di typescript
// jadi merubah bentuk sebuah objek
// Dalam OOP, polymorphism memungkinkan:
// - Satu interface/class dasar bisa digunakan untuk banyak jenis objek turunan
// - Objek-objek yang berbeda bisa diperlakukan secara seragam

// PENTING NIH
// jadi simplenya memungkinkan objek turunan memiliki perilaku berbeda meskipun diakses
// melalui referensi dari parent-nya.

// jadi sebenarnya method override itu adalah polimorphism
// karena dia merubah bentuk oleh si turunannya terhapdap bentuk aslinya
// yang ada di parentnya
//  jadi parent menyediakan "kontrak umum", dan turunan bisa punya
// implementasi yang berbeda.

// dan juga nanti ada polimorphism interface, nah kalo ini tuh
// merukan bentuk oleh yang mirip, terhadap bentuk aslinya yang ada di interface

// nih bacaaa
// Interface adalah kontrak perilaku.
// Semua class yang mengimplementasikan interface harus menyediakan bentuk (implementasi)
// untuk method yang dijanjikan di interface itu.
// Ini juga termasuk polymorphism, karena banyak class bisa punya bentuk implementasi
// berbeda terhadap interface yang sama.

class Employee {
  String name;
  Employee(this.name);
}

class Manager extends Employee {
  Manager(String name) : super(name);
}

class VicePresident extends Manager {
  VicePresident(String name) : super(name);
}


void main() {

  // atau gini nih, ini adlaah method polimorphism

  void sayhello(Employee data){
    if(data is VicePresident){
      final dataVp = data as VicePresident;
      print('ini adalah vp ${dataVp.name}');
    }else if(data is Manager){
      final dataMng = data as Manager;
      print('ini adalah manager ${dataMng.name}');
    }else if(data is Employee){
      final dataEmp = data as Employee;
      print('ini adalah employee ${dataEmp.name}');
    }else {
      print('tidak diketahui');
    }
  }

  Employee employee = Employee('Rafa emp');
  print(employee);

  employee = Manager('Rafa mng');
  print(employee);

  employee = VicePresident('Rafa vp');
  print(employee);

  // Kita membuat list yang bertipe dasar: List<Hewan>
  List<Hewan> daftarHewan = [Kucing(), Anjing(), Hewan()];

  for (var hewan in daftarHewan) {
    // Meski bertipe Hewan, method `suara()` yang dipanggil akan sesuai dengan
    // jenis objek sebenarnya (Kucing, Anjing, atau Hewan)
    hewan.suara(); // Ini adalah contoh polymorphism (bentuk dinamis)
  }

  // Output:
  // Kucing: Meong
  // Anjing: Guk Guk
  // Hewan mengeluarkan suara
}

// Apa itu Polymorphism?
// Polymorphism berasal dari bahasa Yunani: "poly" = banyak, "morph" = bentuk
// Secara sederhana, polymorphism adalah kemampuan suatu objek untuk memiliki banyak bentuk,
// khususnya ketika objek tersebut diakses melalui referensi tipe induknya.

// Dalam OOP, polymorphism memungkinkan:
// - Satu interface/class dasar bisa digunakan untuk banyak jenis objek turunan
// - Objek-objek yang berbeda bisa diperlakukan secara seragam

// ============================================================================
// JENIS POLYMORPHISM DI DART (dan OOP secara umum)
// ============================================================================

// 1. Compile-time Polymorphism (Static Polymorphism)
//    - Contoh: Method Overloading (tidak didukung langsung oleh Dart)

// 2. Runtime Polymorphism (Dynamic Polymorphism)
//    - Contoh: Method Overriding (didukung penuh di Dart)
//    - Inilah bentuk polimorfisme yang umum digunakan di Dart

// ============================================================================
// CONTOH RUNTIME POLYMORPHISM DENGAN INHERITANCE & METHOD OVERRIDING
// ============================================================================

class Hewan {
  void suara() {
    print("Hewan mengeluarkan suara");
  }
}

class Kucing extends Hewan {
  @override
  void suara() {
    print("Kucing: Meong");
  }
}

class Anjing extends Hewan {
  @override
  void suara() {
    print("Anjing: Guk Guk");
  }
}

// ============================================================================
// MENGAPA KITA MEMBUTUHKAN POLYMORPHISM?
// ============================================================================

// 1. Membuat kode lebih fleksibel dan reusable
// 2. Memudahkan ekspansi tanpa perlu ubah banyak kode
// 3. Memungkinkan kita menulis kode generik yang bisa menangani banyak jenis objek
// 4. Cocok untuk menerapkan prinsip SOLID, terutama OCP (Open-Closed Principle)

// ============================================================================
// CONTOH POLYMORPHISM DI KONTEKS INDUSTRI (kasus nyata)
// ============================================================================

// Misalkan kita membuat sistem pembayaran di e-commerce,
// dan setiap metode pembayaran memiliki perilaku sendiri.

abstract class Pembayaran {
  void prosesPembayaran();
}

class PembayaranKartu extends Pembayaran {
  @override
  void prosesPembayaran() {
    print("Memproses pembayaran via Kartu Kredit...");
  }
}

class PembayaranTransfer extends Pembayaran {
  @override
  void prosesPembayaran() {
    print("Memproses pembayaran via Transfer Bank...");
  }
}

class PembayaranEWallet extends Pembayaran {
  @override
  void prosesPembayaran() {
    print("Memproses pembayaran via E-Wallet...");
  }
}

void main2() {
  List<Pembayaran> metode = [
    PembayaranKartu(),
    PembayaranTransfer(),
    PembayaranEWallet(),
  ];

  for (var bayar in metode) {
    bayar.prosesPembayaran(); // Tetap gunakan interface yang sama
  }
}

// Output:
// Memproses pembayaran via Kartu Kredit...
// Memproses pembayaran via Transfer Bank...
// Memproses pembayaran via E-Wallet...

// Penjelasan:
// - Kita bisa menambahkan metode pembayaran baru tanpa ubah kode utama
// - Karena kita hanya bergantung pada interface dasar (class Pembayaran)

// ============================================================================
// KESIMPULAN / RANGKUMAN
// ============================================================================

// Polymorphism adalah konsep OOP yang memungkinkan objek dari kelas turunan
// diperlakukan sebagai objek dari kelas induknya.

// Di Dart, polymorphism muncul saat:
// - Mengakses objek melalui tipe superclass atau interface
// - Meng-*override* method yang kemudian dipanggil secara dinamis

// Manfaat Polymorphism:
// - Mempercepat ekspansi dan fleksibilitas kode
// - Mendukung prinsip desain OOP seperti Open/Closed Principle
// - Menyederhanakan pengelompokan dan pemrosesan objek yang memiliki kesamaan interface

// Dengan polymorphism, kita bisa menulis kode yang lebih umum, namun tetap kuat
// dalam menangani berbagai objek secara berbeda tergantung bentuk/jenis nyatanya.

// ============================================================================
