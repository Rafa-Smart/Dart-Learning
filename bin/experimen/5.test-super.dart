
class Parent {
  final String nama;
  var umur;
  Parent({required this.nama, this.umur});
}

class Child extends Parent{

  // jadi 
  // KALO MAUPAKE SUPER, DIATASNYA JUGA HARUS PAKE CONSTRUCTORNYAA

  // dan harus sama, jadi kalo diatwsnya itu required mak dibahanya juga required
  // Child({required super.nama, super.umur});
  // bisa gitu atau bisajug gini

Child({required String namaParam, required int umurParam})
  :super(nama: namaParam, umur: umurParam);

}

// Ini adalah class induk
class Orang {
  final String nama;

  // Constructor class Orang
  Orang({required this.nama});
}

// Ini adalah class turunan yang mewarisi dari Orang
class Mahasiswa extends Orang {
  final String jurusan;

  // Constructor Mahasiswa meneruskan nama ke constructor Orang
  Mahasiswa({required this.jurusan, required super.nama});
}

void main() {
  // Membuat instance Mahasiswa
  final mhs = Mahasiswa(nama: 'Rafa', jurusan: 'Informatika');

  print('Nama: ${mhs.nama}');
  print('Jurusan: ${mhs.jurusan}');
}

