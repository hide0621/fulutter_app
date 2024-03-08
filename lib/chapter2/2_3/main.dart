import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFe91e63),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(secondary: const Color(0xFFe91e63)),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
        // この部分を追記しないとヘッダー部分のテーマデータの設定を反映できない
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          "Hello Flutter!",
          style: TextStyle(
              fontSize: 32.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
