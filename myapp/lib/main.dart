import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

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
            TheAmazingRow(
              icon: Icons.wb_sunny,
              label: "Hello World !",
            ),
            TheAmazingRow(
              icon: Icons.wb_cloudy,
              label: "Hola desde un mundo lejano !",
            ),
            TheAmazingRow(
              icon: Icons.group_work_rounded,
              label: "Hailo aus einer fernen Welt !",
            ),
            for (final Pokemon item in pokedex)
              TheAmazingRow(
                label: item.getName(),
                icon: item.getIcon(),
              ),
          ],
        ),
      ),
    );
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 8,
        right: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          boxShadow: [
            BoxShadow(color: Colors.teal[400], spreadRadius: 1),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20, height: 40),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: Colors.pink[200]),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Pokemon extends StatelessWidget {
  const Pokemon(
    this.name,
    this.icon,
  );

  getName() {
    return this.name.toUpperCase();
  }

  getIcon() {
    return this.icon;
  }

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {}
}
