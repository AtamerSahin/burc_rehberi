import 'package:flutter/material.dart';
import 'package:horoscope_guide/horoscope_list.dart';

import 'horoscope_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/HoroscopeList",
      routes: {
        "/": (context) => HoroscopeList(),
        "/HoroscopeList": (context) => HoroscopeList(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements =
            settings.name.split("/"); //. HoroscopeDetail/1 (index)
        if (pathElements[1] == "HoroscopeDetail") {
          return MaterialPageRoute(
              builder: (context) =>
                  HoroscopeDetail(int.parse(pathElements[2])));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: 'Burç Rehberi',
      theme: ThemeData(primarySwatch: Colors.orange),
      // home: HoroscopeList(),
    );
  }
}
