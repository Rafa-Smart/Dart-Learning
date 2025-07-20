void main() {
  // tes bikin map sendiri
  // disini ga perlu pake ? juga ga papa keknya
  List<int> myMap(
    List<int> data,
    int Function(int? index, int value, List<int> list) map,
  ) {
    List<int> hasil = [];
    for (var i = 0; i < data.length; i++) {
      hasil.add(map(i, data[i], data));
    }
    return hasil;
  }

  List<int> arr = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // disini saya hanya ingin mengambil param vauenya saja, yg lainnya saya abaikan
  List<int> hasil = myMap(arr, (_, value, _) => value! * 2);
  print(hasil);

  List<int> myFilter(
    List<int> data,
    bool Function(int? index, int value, List<int>? data) filter,
  ) {
    List<int> hasil = [];
    for (var i = 0; i < data.length; i++) {
      if (!filter(i, data[i], data)) {
        // jika return false
        // maka lewat
        continue;
      }
      hasil.add(data[i]);
    }

    return hasil;
  }

  List<int> arr2 = [1,2,3,4,5,6,7,8,9,10];
  List<int> hasil2 = myFilter(arr, (_, data, _){
      return data % 2 == 0;
  });
  print(hasil2);

  // APA ITU HIGHER-ORDER FUNCTION?
  // ----------------------------------------------------------------------------
  // Higher-Order Function (HOF) adalah fungsi yang:
  // - Menerima fungsi lain sebagai parameter
  // - ATAU mengembalikan fungsi sebagai hasil
  // - ATAU melakukan keduanya (menerima dan mengembalikan fungsi)
  //
  // Dart mendukung HOF karena fungsi dianggap sebagai *first-class object*, artinya
  // fungsi dapat diperlakukan layaknya data: disimpan dalam variabel, dikirim, atau dikembalikan.

  // KENAPA HARUS MENGGUNAKAN HIGHER-ORDER FUNCTION?
  // ----------------------------------------------------------------------------
  // - Memungkinkan kita menulis kode yang lebih abstrak dan fleksibel
  // - Mengurangi duplikasi dan meningkatkan reusable code
  // - Memungkinkan pemrosesan dinamis terhadap data atau perilaku
  // - Sangat berguna dalam functional programming, UI callback, dan data transformation
  // - Sering digunakan dengan koleksi (`map()`, `forEach()`, `filter`, dll)

  // BAGAIMANA CARA KERJANYA?
  // ----------------------------------------------------------------------------
  // Dart akan menyimpan referensi ke fungsi yang dikirim, bukan menjalankannya langsung.
  // Fungsi yang dikirim dipanggil di dalam HOF sebagai callback atau closure.
  // Bisa juga mengembalikan fungsi baru dengan konfigurasi tertentu (factory of behavior).

  // ============================================================================
  // CONTOH 1: FUNGSI SEBAGAI PARAMETER
  // ============================================================================

  void prosesAngka(int angka, int Function(int) operasi) {
    // Fungsi ini menerima angka dan fungsi operasi sebagai parameter
    int hasil = operasi(angka);
    print('Hasil operasi: $hasil');
  }

  // Fungsi-fungsi yang bisa dikirim ke HOF:
  int kuadrat(int x) => x * x;
  int tambahSatu(int x) => x + 1;

  // ============================================================================
  // CONTOH 2: FUNGSI SEBAGAI NILAI KEMBALIAN
  // ============================================================================

  Function buatKelipatan(int faktor) {
    // Fungsi ini mengembalikan fungsi yang menerima angka dan mengalikannya
    return (int x) => x * faktor;
  }

  // ============================================================================
  // CONTOH 3: ANONYMOUS FUNCTION (LAMBDA) SEBAGAI ARGUMEN HOF
  // ============================================================================

  void tampilkanList(List<int> data, void Function(int) aksi) {
    for (var item in data) {
      aksi(item);
    }
  }

  // ============================================================================
  // CONTOH 4: PENGGUNAAN HOF DENGAN KOLEKSI
  // ============================================================================

  void contohKoleksi() {
    var angka = [1, 2, 3, 4, 5];

    // map() akan mengubah setiap elemen
    var kuadrat = angka.map((e) => e * e).toList();

    // where() akan memfilter elemen
    var genap = angka.where((e) => e % 2 == 0).toList();

    // forEach() hanya menjalankan aksi (tidak mengembalikan list)
    angka.forEach((e) => print('Angka: $e'));
  }


  void main() {
    // Mengirim fungsi sebagai parameter
    prosesAngka(5, kuadrat); // Hasil: 25
    prosesAngka(10, tambahSatu); // Hasil: 11

    // Menggunakan fungsi kembalian
    var kaliTiga = buatKelipatan(3);
    print(kaliTiga(4)); // 12

    var kaliSepuluh = buatKelipatan(10);
    print(kaliSepuluh(5)); // 50

    // Fungsi anonim sebagai parameter
    tampilkanList([10, 20, 30], (e) {
      print('Item: $e');
    });

    // HOF pada koleksi
    contohKoleksi();
  }

  // ============================================================================
  // CATATAN TAMBAHAN:
  // ----------------------------------------------------------------------------
  // 1. Semua fungsi di Dart adalah objek dari tipe Function.
  // 2. Tipe parameter fungsi ditulis seperti ini:
  //    `int Function(int)` artinya fungsi yang menerima int dan mengembalikan int
  // 3. Kita bisa menggunakan `typedef` untuk membuat alias tipe fungsi agar lebih bersih.
  //    Contoh:
  //      typedef Operasi = int Function(int);
  //      void proses(int a, Operasi op) { ... }
  // 4. HOF sangat kuat dalam pemrograman berbasis event, UI handler, middleware, dan stream.
  // 5. Closure dalam HOF menangkap variabel lokal di luar fungsi dan menyimpannya.
}
