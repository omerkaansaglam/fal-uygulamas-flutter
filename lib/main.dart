import 'package:flutter/material.dart';
import 'package:untitled/Screens/Anasayfa.dart';

void main() => runApp(MyApp());
const bordersidecolor = Color(0xFFc88843);
MaterialColor mainColor = MaterialColor(0xFF35105e, color);
MaterialColor secondColor = MaterialColor(0xFFc88843, color);
MaterialColor thirdColor = MaterialColor(0xFF58169d, color);
Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deneme Appbar',
      theme: ThemeData(
        primarySwatch: mainColor,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.amber[600],
            displayColor: Colors.amber[600],
          )
      ),
      home: Anasayfa(),
    );
  }
}