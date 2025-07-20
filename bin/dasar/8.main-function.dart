void main(List<String> args) {
  // jadi fungsi main ini adalah, fungis yg dijalankan pertama kali oleh si dartnya


  // nah di main function ini, ada fitur unik, yaitu
  // main function paramter

  // jadi nanti main function ini akna memiliki paramter
  // List<String> yang akan diambil ketika user
  // menjalankan program filenya, misal
  // bin/nama_file <args1>, <args2>, <args3>
  // atau kalo mau pake spasi bia gini
  // bin/nama_file '<args1 argslagi>', '<args2 argslagi argslagi>', '<args3>'

  // nah jadi argument ini, akan masuk ke param List<String>
  // yang ada di main function

  print("args: $args");
  // jadi kalo ga ada yg ditulis user maka akn args: []

  // tapi kalo ditulis user gini
  // dart run bin\8.main-function.dart" jamal, udin, siti
  // hasil: args: [jamal, udin, siti]
}