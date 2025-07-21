import 'dart:io';

void main(){
    print('program menghitung luas segi panjang');
    stdout.write("maukan panjang persegi panjang ? ");
    double panjang = double.parse(stdin.readLineSync()!);

    stdout.write("maukan lebar persegi panjang ? ");
    double lebar = double.parse(stdin.readLineSync()!);

    final luas = panjang * lebar;
    print('luas data: $luas');

}