void main(){

  String chaine = "ACGTTTTTACG";
  
  bool estADN(String str){
    bool valide = true;
    for (int i = 0; i < str.length; i++){
      if(str[i] == "A" || str[i] == "C" || str[i] == "G" || str[i] == "T"){
        valide = true;
      }else if(str == "") {
        valide = true;
      }else{
        valide = false;
      }
    }
    return valide;
  }

  print(estADN(chaine));

  String? transcrit(String chaine){
    final arr = chaine.split("");
    String chFinal = "";
    if (estADN(chaine)){
      for(int i = 0; i < chaine.length; i++){
        if(arr[i] == "T"){
          arr[i] = "U";
        }
          chFinal += arr[i];
      }
      return chFinal;
    }else{
      return "La chaine n'est pas valide !";
    }
  }
  print(transcrit(chaine));

  String baseComplementaire(String chaine){
    String chFinal = "";
    if(estADN(chaine)){
      for(int i = 0; i < chaine.length; i++){
        
      } 
    }else{
      return = "";
    }
  }
}