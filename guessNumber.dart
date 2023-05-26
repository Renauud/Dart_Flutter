import "dart:math";
import "dart:io";

void main(){
  final aDeviner = 1 + Random().nextInt(100);
  for (int i = 0; i < 8; i++){
  String? saisi = stdin.readLineSync();
  int nb = int.parse(saisi!);
    if (nb > aDeviner){
      print("C'est moins");
    }else if(nb < aDeviner){
      print("C'est plus");
    }else{
      return print("C'est gagné !");
    }
  }
  print("C'est perdu ! Le nombre mystère était " + aDeviner.toString() + " !");
}