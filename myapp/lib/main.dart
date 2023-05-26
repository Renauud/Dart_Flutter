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

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola Mundo !"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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
                  onPressed: () => print("Pokemon ajouté !"),
                ),
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
                onPressed: () => print("Hallo Welt")),
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

const IconData snowFlakeIcon = Icons.ac_unit;

final pokedex = const <Pokemon>[
  Pokemon("Artikodin", snowFlakeIcon),
  Pokemon("Sulfura", Icons.ac_unit),
  Pokemon("Electhor", Icons.ac_unit),
  Pokemon("Mewtwo", Icons.ac_unit),
];
