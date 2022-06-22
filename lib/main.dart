import 'package:flutter/material.dart';
import 'package:flutter_set_of_decorated_cards/card_set_page_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tavo'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: CardSetPageBody(),
      ),
    );
  }
}
