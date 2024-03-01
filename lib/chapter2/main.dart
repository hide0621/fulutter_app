import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutter サンプル';
  final message = 'サンプル・メッセージ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: this.title,
        message: this.message,
      ),
    );
  }
}

// 動的に表示が切り替わるように、このApp専用のWidgetをWrapして作成
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.message})
      : super(key: key);
  final String title;
  final String message;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 上記で作成したWidgetに紐づくこのApp専用のStateを作成
class _MyHomePageState extends State<MyHomePage> {
  String _message = 'Hello!';

  void _setMessage() {
    // setStateはstateの変更をState class（今回は_MyHomePageState）に通知するメソッドで
    // State classが備え持っているメソッド
    setState(() {
      _message = 'タップしました！';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        _message,
        style: TextStyle(fontSize: 32.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        tooltip: 'set message.',
        child: Icon(Icons.star),
      ),
    );
  }
}
