void main() {
  // disini kita ketika mengguakna fungsi yg mereturnkan data
  // maka kita perlu beritahu kalo dia mengemblikan tipe data apa, gituu

  int sum(List<int> data){
    int total = 0;
    for(var i in data){
      total += i;
    }
    return total;
  }

  final hasil = sum([45,4,5,4,3]);
  print(hasil); // 61


  // ini kalo pake argument, dan ternyata kita ga bisa pake arguments, sama ayak di js
  // int sum2([List<int> args]){
  //   var hasil = 0;
  //   for(var i in args){
  //     hasil += i;
  //   }
  //   return 5;
  // }
  // final hasil9 = sum2(4,4,5,6,7,8,4,6);


  // cara cara membaut fungsi
  String test(String nama) => 'haloo $nama';

  final hasil4 = (String nama) => {
    'haloo $nama'
  };

}