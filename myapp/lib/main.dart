import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/pages/details_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/route/route.dart';

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
      initialRoute: PageName.home,
      routes: {
        PageName.home: (context) => const HomePage(),
        PageName.detail: (context) => const DetailPage(),
      },
    );
  }
}
