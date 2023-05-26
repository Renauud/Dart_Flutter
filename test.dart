void main() {
  final unAnimal = Animal(species: "Chat");
  print(unAnimal);
  print(unAnimal.species);
  unAnimal.describe();

  print("");
  
  final felix = Cat(name: "felix");
  print(felix);
  print(felix.species);
  print(felix.name);
  felix.describe();
}

class Animal {
  final String species;

  Animal({required this.species});
  void describe() => print("Un animal : $species");
  
  @override
  toString() => "specie : $species";
}

class Cat extends Animal {
  final String name;

  Cat({required this.name})
    : super(
      species : "chat",
    );
  
    @override
    void describe(){
      super.describe();
      print("Le chat s'appelle $name");
    } 
}
