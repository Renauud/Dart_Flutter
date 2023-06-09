import 'package:flutter/material.dart';
import 'package:myapp/entities/pokemon.dart';
import 'package:myapp/widget/the_amazing_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  void deleteItem(String name, List pokemonList) {
    pokemonList.remove(name);
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  IconData snowFlakeIcon = Icons.ac_unit;

  final pokedex = <Pokemon>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola Mundo !"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Saisissez un nom !",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      const snackBarPresent = SnackBar(
                          content: Text(
                              'Le Pokemon est déjà présent dans la liste !'));
                      const snackBarCourt = SnackBar(
                          content: Text(
                              "Le nom du Pokemon doit faire au moins 2 lettres !"));

                      final nameToAdd =
                          controller.text.toUpperCase().replaceAll(" ", "");
                      var present = false;
                      for (var pokemons in pokedex) {
                        if (nameToAdd.trim() == pokemons.name) present = true;
                      }
                      if ((nameToAdd.trim()).length > 2) {
                        if ((present == false)) {
                          pokedex.insert(
                            0,
                            Pokemon(nameToAdd, Icons.question_answer_sharp),
                          );
                          controller.clear();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBarPresent);
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarCourt);
                      }
                      setState(() {});
                    }),
              ],
            ),
            for (final Pokemon item in pokedex)
              TheAmazingRow(
                label: item.getName(),
                icon: item.getIcon(),
              ),
            // TheAmazingRow(
            //   icon: Icons.wb_sunny,
            //   label: "Hello World !",
            // ),
            // TheAmazingRow(
            //   icon: Icons.wb_cloudy,
            //   label: "Hola desde un mundo lejano !",
            // ),
            // TheAmazingRow(
            //   icon: Icons.group_work_rounded,
            //   label: "Hailo aus einer fernen Welt !",
            // ),
          ],
        ),
      ),
    );
  }
}
