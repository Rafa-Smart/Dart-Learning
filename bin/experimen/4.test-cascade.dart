void main() {
  // nyoba cascade notation

  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8]..reversed;

  // jadi ternyata cascade ini itu sama kayak chaining
  // interface Test {
  //     nama:string,
  //     umur:number
  // }

  const Map<String, dynamic>json = {
      "nama":"jamal",
      "umur":15
  };

  Map<String, dynamic>create(data){
      return data;
  }


  // jaid yg asalnya jamal, jadi siti dan seterusnya
  final hasil = create(json)
  ..['nama'] = "siti"
  ..['umur'] = 90;

  // itu yg di typescript
  // jadi g bisa lebih dari sekali chainingnya

  // /tapi kalo di dart bisa banyak



}
