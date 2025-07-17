// https://chatgpt.com/c/6878deae-7484-8009-98dc-1c563e444f70
// jadi simpenya record ini sama kayak interface atau lebih tepatnya
// sama kayak type di typescript

// dan dia juga bisa union, dan kalo array yang bertipe, record ini
// berati nanti isi dari array atau list tersebut, harus mengikuti si recordya
// lhiat saja di sana, dan tanya lagi aja kalo belum paham

// ini contoh yang ga ada di typescript, tapi bisa ada di dart
// dan ini sebenarnya sangat mirip penggunanya dengan type di ts

void main() {
  // jadi kita buat dulu, variable nya yg sidah ditetapkan typenya, tapi belum di implementasi
  ({int a, bool b}) record;

  // nah disni kita implementasinya
  record = (a: 123, b: true);

  // nah ini adalah contohnya yang sama
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 4);

  // Compile error! These records don't have the same type.
  // recordAB = recordXY;

  // nah jadi meskipun di dart, jika typenya itu maksudnya sama
  // tapi strukkturnya berbeda, maka dianggal berbeda
  // dan jika beda field maka beda juga typenya

  // tapi, klao gini juga ga error
  (int, int) recordAB2 = (1, 2);
  (int, int) recordXY2 = (3, 4);

  final hasil = recordAB2 =
      recordXY2; // OK, karena positional record hanya lihat tipe dan urutan
  print(hasil); // prints: (3, 4)

  // tapi jika
  final hasil2 = (recordXY2 == recordAB2);
  print(hasil2); // true

  print(record);
  print(recordAB);
  print(recordXY);

  // dan cara aksesnya itu gini
  var record3 = ('first', a: 2, b: true, 'last');

  print(record3.$1); // Prints 'first'
  print(record3.a); // Prints 2
  print(record3.b); // Prints true
  print(record3.$2); // Prints 'last'

  // jadi kalo gaada field, maka akan emngunakan $posisi
  // dan posisinya itu dimulai dengan 1

  // ada lagi conoth berikutnya
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // Prints 'true'.
  // salinan konten
  ({int x, int y, int z}) point2 = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color2 = (r: 1, g: 2, b: 3);

  print(point2 == color2); // Prints 'false'. Lint: Equals on unrelated types

  // ini aga rumit dikit nih
  String? presentKey = 'Apple';
  String? absentKey = null;

  int? presentValue = 3;
  int? absentValue = null;

  var itemsA = {presentKey: absentValue}; // {Apple: null}
  var itemsB = {presentKey: ?absentValue}; // {}

  var itemsC = {absentKey: presentValue}; // {null: 3}
  var itemsD = {?absentKey: presentValue}; // {}

  var itemsE = {absentKey: absentValue}; // {null: null}
  var itemsF = {?absentKey: ?absentValue}; // {}

  // jadi lao pake nullable, dan jika salah satu nilai, mau itu key, atau value
  // itu bernilai null, maka nilai hasilnya akan {}

  // tapi jika tidak nullable, dan salah satunya ternyaa ada yang null
  // maka null tersebut akan jadi key / valuenya

  print(itemsF);
  print(itemsB);
  print(itemsA);
  print(itemsE);
  print(itemsD);
  print(itemsC);
}
