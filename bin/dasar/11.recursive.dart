void main(){
  void loop(int value){
  if(value == 0){
    print('selesai');
    return;
  } else {
    print('value = $value');
    loop(value -1);
  }
}

loop(100000); // max value = 88710
}