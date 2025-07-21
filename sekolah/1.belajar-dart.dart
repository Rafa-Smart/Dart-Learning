import 'dart:io';

void main() {
  print('program menghitung luas segi panjang');
    stdout.write("maukan panjang persegi panjang ? ");
    double panjang = double.parse(stdin.readLineSync()!);

    stdout.write("maukan lebar persegi panjang ? ");
    double lebar = double.parse(stdin.readLineSync()!);



  hitungLuas(panjang, lebar);


}
  void hitungLuas(double panjang, double lebar) {

    final luas = panjang * lebar;
    print('luas data: $luas');
  }
