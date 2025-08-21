void main() {
  // https://chatgpt.com/c/6878e78b-439c-8009-8525-94e6f2d4d8be
  var includeItem = true;
  var items = [0, if (includeItem) 1, 2, 3]; // [0, 1, 2, 3]

  // jadi maksdunya itu, jika includeItem itu true maka akan return 1
  // jika false maka akan return 2, 3
  // nah 2, 3 ini itu apa, dia adalah elemen elemen pertama setelah operasi ifnya
  // kalo 0 adalah elemen pertama sebelum si ifnya

  // ini juga sama
  var name = 'apple';
  var items2 = [0, if (name == 'orange') 1 else 10, 2, 3]; // [0, 10, 2, 3]
  // jadi jika name itu == orange, maka return 1, jika tidak
  // maka akan return 10, dan dilanjut dengan elemen 2, 3

  // lalu ada pattern matching di dart
  Object data = 123;
  var typeInfo = [
    if (data case int i) 'Data is an integer: $i',
    if (data case String s) 'Data is a string: $s',
    if (data case bool b) 'Data is a boolean: $b',
    if (data case double d) 'Data is a double: $d',
  ]; // [Data is an integer: 123, Data is a double: 123]

  // jadi gini, pada if yang pertama
  // itu gini, jika data kita matchingkan dnegan int
  // /berati jika data itu sama polanya dengan int, maka nilai data akan disimpan
  // edalam variable i, lalu akan return string 'Data is an integer: $i'
  // dan begitu seterusnya

  // contoh 2
  // namanya adalah  type pattern with named fields.
  var word = 'hello';
  var items3 = [
    1,
    if (word case String(length: var wordLength)) wordLength,
    3,
  ]; // [1, 5, 3]

  // jadi gini, disini kita cek, jika word itu matching dengan objek instance dari String
  // (yg artinya dia adlah objek string)
  // yang otomatis juga punya property length,
  // maka kita ambil lengthnya pake destruction si lengthnya, lalu disimpan di var wordLength
  // lalu return wordLength nya yaitu 3
  // ini penjelasannya
  // https://chatgpt.com/c/6878ed9f-648c-8009-8a6e-874baf22b80c

// jadi gini lengkapnya
//   class Person {
//   final String name;
//   final int age;
//   const Person({required this.name, required this.age});
// }
// Untuk bisa digunakan dalam pattern matching, field harus:
// 1. final
// 2. Dideklarasikan di konstruktor
// 3. Tidak disembunyikan (harus dapat diakses langsung)

// 2. Gunakan type pattern with named fields:
// var person = Person(name: 'Rafa', age: 21);

// if (person case Person(name: var n, age: var a)) {
//   print('Nama: $n, Umur: $a');
// }
// Output: Nama: Rafa, Umur: 21



  // contoh lagi
  var orderDetails = ['Apples', 12, ''];
  var summary = [
    'Product: ${orderDetails[0]}',
    if (orderDetails case [_, int qty, _]) 'Quantity: $qty',
    if (orderDetails case [_, _, ''])
      'Delivery: Not Started'
    else
      'Delivery: In Progress',
  ]; // [Product: Apples, Quantity: 12, Delivery: Not Started]

  // jaid gini di pengecekan if pertama
  // itu di cek, jika orderDetails itu matching dengan pola List [_, int qty, _]
  // jadi elemen pertamanya itu diabaikan, dan 
  // elemen keduanya itu harus int, jika benar int -> masukan ke variable qty
  // elemen ketiga diabaikan

  // karena kondisi ini true, maka return string 'Quantity: $qty'

  // dan begitu selanjutnya

  // 🔹 4. Destructuring Object (dengan Class)

// Untuk class, Dart tidak punya destructuring langsung seperti JS {name, age} = obj;.
// Tapi bisa pakai pattern matching dengan field (Dart 3):

// class Person {
//   final String name;
//   final int age;
//   Person(this.name, this.age);
// }

// void main() {
//   var person = Person("Jamal", 25);

//   switch (person) {
//     case Person(name: var n, age: var a):
//       print("Name: $n, Age: $a"); // Name: Jamal, Age: 25
//   }
// }


// 📌 Person(name: var n, age: var a) berfungsi seperti destructuring untuk objek Person.
}