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



// 5. default param, harus pake named function
// jadi karena defaultnnya named function itu adaalh nullable, maka kita bisa
// jadikannya agar tidak nullable menggunakan default param
void sayHello4({String nama = "jamal", int? umur}){
  print('haloo $nama umur ${umur?.toDouble()}');
}
sayHello4(); // ini bisa karena, yg awal itu dia default
// dan yan gkedua itu dia boleh null, atau ga diisi

// nah kalo ga pake kurung kurawal, kalo kita pake param yg pake ?
// maka dia pas dipanggil, dan jika param yg pake ? ini tidak diisi
// maka akan eror

// /tapi klo kita pake {int? umur}, maka ketika ktia panggil
// fungsinya, dan tidak memasukan param umur, maka tidak akan error

// 6. ketika di named param, kita mau required.
// maka kita bisa pake required

void sayHello7({required String nama, int? umur}){
  print('halo $nama umur $umur');
}

// sayHello7(); error, karen nama itu wajib

sayHello(nama: "jamal");
sayHello(nama: "jamal", umur: 89);







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
