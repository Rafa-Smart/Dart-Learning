void main() {


  // jaid gini ya, kaerna di dart itu ga ada undefined, adanya null
  // jadi kita bisa gini, ada fungsi yg paramnya itu nullable
  // ada juga yg paramnya itu bersifat opsional, jadi ga wajib diisi

  // nah jadi yg param yg bsia nullable ini wajib diisi, tapi boleh diisi
  // dengna null

  // tapi kalo yg opsional, itu boelh diisi, dan defaultnya juga
  // dia aalah nullable juga
  // dan kalo ga mau nullable, maka bisa gunakan default parameter pake =

  void nama(int a, int b){
    print(a + b);
  }

  // nama(); -> error
  // nama(5); -> error
  nama(7,7); // berhasil

  // ini pake nullable
  void nama2 (String? nama) => {
    print('haloo $nama')
  };

  // nama2() ga bisa, jadi ini tetap wajibmski nullable
  nama2("jamal"); // bisa
  nama2(null);

// 3. ini pake named function
void sayHello({String? nama, int? umur}) {
  print('haloo $nama, umur $umur');
};
sayHello(); // haloo null, umur null -> bisa
// sayHello("jamal",15); ga bisa, jadi harus pake naa paramnya
sayHello(nama: "jamal", umur: 17); // ini bisa


// 4. opsioal parameter
void sayHello2(String? nama, [int? umur]){
  print('haloo $nama umur mu ${umur?.toDouble()}');
}
// sayHello2(); ga bisa
sayHello2("jamal"); //  bisa -> haloo jamal umur mu null
sayHello2("jamal", 25); // bisa -> haloo jamal umur mu 25.0

print('----------');


  // Fungsi tanpa kembalian (void)
  void sapa(String nama) {
    print('Halo, $nama!');
  }

  // Fungsi tanpa parameter
  void salam() {
    print('Selamat pagi!');
  }

  // Fungsi dengan nilai default parameter
  void cetakPesan(String pesan, [String author = 'Anonim']) {
    print('$pesan - oleh $author');
  }

  // Fungsi dengan named parameter (opsional)
  void buatAkun({String? email, String? password}) {
    print('Email: $email');
    print('Password: $password');
  }

  // Fungsi dengan named parameter dan nilai default
  void kirimEmail({String subject = 'Tanpa Subjek', String isi = ''}) {
    print('Subject: $subject');
    print('Isi: $isi');
  }

  // Fungsi sebagai nilai (function literal / anonymous function / lambda)
  var fungsiKali = (int x, int y) {
    return x * y;
  };

  // Fungsi lambda singkat (arrow function)
  int kurang(int a, int b) => a - b;

  // Fungsi sebagai parameter (higher-order function)
  void prosesAngka(int angka, int Function(int) callback) {
    int hasil = callback(angka);
    print('Hasil: $hasil');
  }

  // Fungsi yang mengembalikan fungsi (closure)
  Function pembuatKelipatan(int faktor) {
    return (int angka) => angka * faktor;
  }

  // Fungsi tanpa return
  sapa('Rafa'); // Halo, Rafa!

  // Fungsi tanpa parameter
  salam(); // Selamat pagi!

  // Fungsi dengan parameter opsional (posisional)
  cetakPesan('Belajar itu menyenangkan');
  cetakPesan('Belajar Dart', 'Rafa');

  // Fungsi dengan named parameter
  buatAkun(email: 'aku@email.com', password: '123456');
  // jadi kalo named parameter, ketika kita panggil, tapi ga pake
  // nama parameternya, maka akan error
  // buatAkun("jamal", "345"); // error


  // Fungsi dengan default parameter
  kirimEmail(isi: 'Jangan lupa meeting jam 10');

  // Fungsi literal
  print(fungsiKali(4, 6)); // 24

  // Arrow function
  print(kurang(10, 7)); // 3

  // Higher-order function
  prosesAngka(5, (x) => x * x); // 25

  // Closure
  var kaliTiga = pembuatKelipatan(3);
  print(kaliTiga(4)); // 12
}
