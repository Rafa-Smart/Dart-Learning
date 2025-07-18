void main() {

  // Anonymous Function (fungsi anonim / fungsi tanpa nama) adalah fungsi
  // yang tidak memiliki identifier (nama), tetapi bisa langsung digunakan
  // sebagai nilai, disimpan dalam variabel, atau dikirim sebagai argumen.

  // Contoh:
  // (int x, int y) {
  //   return x + y;
  // };

  // Dalam Dart, fungsi adalah *first-class object*:
  // artinya fungsi bisa diperlakukan seperti nilai/data:
  // - Disimpan dalam variabel
  // - Dikirim ke fungsi lain
  // - Dikembalikan dari fungsi

  // ----------------------------------------------------------------------------
  // BAGAIMANA CARA KERJANYA?
  // ----------------------------------------------------------------------------
  // Anonymous function bekerja dengan membuat blok kode yang bisa dieksekusi
  // tapi tidak diberi nama. Fungsi tersebut bisa langsung dipanggil atau
  // disimpan. Dart akan mengeksekusinya seperti fungsi biasa saat dipanggil.

  // ----------------------------------------------------------------------------
  // CONTOH 1: LANGSUNG DIARGUMENKAN KE FUNGSI
  // ----------------------------------------------------------------------------

  void jalankan(Function callback) {
    callback();
  }

  void main() {
    // anonymous function langsung ditulis di dalam argumen
    jalankan(() {
      print('Ini fungsi anonim!');
    });
  }

  // ----------------------------------------------------------------------------
  // CONTOH 2: DISIMPAN DI VARIABEL
  // ----------------------------------------------------------------------------

  var tambah = (int a, int b) {
    return a + b;
  };

  print(tambah(3, 4)); // 7

  // ----------------------------------------------------------------------------
  // CONTOH 3: SEBAGAI ARGUMEN DENGAN PARAMETER
  // ----------------------------------------------------------------------------

  void prosesAngka(List<int> data, void Function(int) callback) {
    for (var item in data) {
      callback(item);
    }
  }

  var angka = [1, 2, 3];

  prosesAngka(angka, (value) {
    print('Nilai: $value');
  });

  // ----------------------------------------------------------------------------
  // CONTOH 4: DENGAN RETURN VALUE
  // ----------------------------------------------------------------------------

  var perkalian = (int x, int y) {
    return x * y;
  };

  print(perkalian(5, 6)); // 30

  // ----------------------------------------------------------------------------
  // CONTOH 5: ANONYMOUS FUNCTION + COLLECTION FUNCTION
  // ----------------------------------------------------------------------------

  var angka3 = [1, 2, 3, 4, 5];

  // menggunakan anonymous function di dalam map
  var hasil = angka.map((e) {
    return e * 2;
  }).toList();

  print(hasil); // [2, 4, 6, 8, 10]

  // ----------------------------------------------------------------------------
  // CONTOH 6: FUNGSI SEBAGAI NILAI KEMBALI DARI FUNGSI LAIN
  // ----------------------------------------------------------------------------

  Function buatKelipatan(int faktor) {
    return (int x) {
      return x * faktor;
    };
  }

  var kaliLima = buatKelipatan(5);
  print(kaliLima(3)); // 15

  // ----------------------------------------------------------------------------
  // VARIASI PENULISAN (ARROW FUNCTION) =>
  // ----------------------------------------------------------------------------
  // Jika isi fungsi hanya satu ekspresi, bisa ditulis dalam bentuk ringkas:

  var kurang = (int a, int b) => a - b;

  print(kurang(10, 4)); // 6

  // Ini ekuivalen dengan:
  // var kurang = (int a, int b) {
  //   return a - b;
  // };

  // ----------------------------------------------------------------------------
  // KAPAN HARUS MENGGUNAKAN ANONYMOUS FUNCTION?
  // ----------------------------------------------------------------------------
  // Gunakan anonymous function jika:
  // - Fungsi hanya dipakai sekali
  // - Tidak perlu dikenali secara eksplisit
  // - Ingin kode lebih ringkas (inline)
  // - Digunakan dalam koleksi seperti map, forEach, where, dll
  // - Cocok untuk callback, event handler, atau fungsi dinamis

  // ----------------------------------------------------------------------------
  // KELEBIHAN:
  // ----------------------------------------------------------------------------
  // - Ringkas
  // - Tidak perlu deklarasi nama terpisah
  // - Langsung bisa digunakan
  // - Mendukung closure (bisa menangkap variabel luar)

  // ----------------------------------------------------------------------------
  // KEKURANGAN:
  // ----------------------------------------------------------------------------
  // - Tidak bisa direferensikan ulang jika tidak disimpan di variabel
  // - Susah dilacak saat debugging jika kompleks
  // - Tidak cocok untuk logika yang panjang atau kompleks

  // ----------------------------------------------------------------------------
  // CLOSURE DALAM ANONYMOUS FUNCTION
  // ----------------------------------------------------------------------------
  // Fungsi anonim bisa mengakses variabel di luar fungsinya (closure)

  var multiplier = 3;

  var kelipatan = (int x) => x * multiplier;

  print(kelipatan(4)); // 12

  // multiplier ditangkap oleh fungsi anonim secara otomatis
  // meskipun berasal dari luar scope-nya

  // ----------------------------------------------------------------------------
  // KESIMPULAN:
  // ----------------------------------------------------------------------------
  // - Anonymous function adalah fungsi tanpa nama
  // - Dapat disimpan, dikirim, atau langsung dijalankan
  // - Cocok untuk kasus sederhana dan sekali pakai
  // - Sangat bermanfaat untuk koleksi, callback, event, dan closure
}
