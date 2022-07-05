import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:orach_payement/authetification.dart';
import 'package:orach_payement/home.dart';
import 'package:orach_payement/inscription.dart';
import 'package:orach_payement/providerObjet.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        primarySwatch: buildMaterialColor(Color(0xFF0A84FF)),
        accentColor: Color(0xFF0A84FF),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: buildMaterialColor(Color(0xFF0A84FF)),
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>orachUser()),
          
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Adaptive Theme Demo',
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: "/",
          routes: {
            "/": (context) => Authentification(),
            "inscription": (context) => Inscription(),
            "home": (context) => Home(),
          },
        ),
      ),
    );
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
