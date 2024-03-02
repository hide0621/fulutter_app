import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutter サンプル';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: this.title,
      ),
    );
  }
}

// 動的に表示が切り替わるように、このApp専用のWidgetをWrapして作成
class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // こうともできる
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 複数のデータを扱うためのクラスを定義
class Data {
  // final化することで、オブジェクト生成時にまで初期化を遅らせることできる(これはconstでは不可能)
  final int _price;
  final String _name;

  Data(this._price, this._name);

  @override
  String toString() {
    return '$_name : $_price 円';
  }
}

// 上記で作成したWidgetに紐づくこのApp専用のStateを作成
class _MyHomePageState extends State<MyHomePage> {
  // テーブルドリブンのようにデータを用意
  static final _data = [
    Data(100, 'りんご'),
    Data(200, 'みかん'),
    Data(300, 'バナナ'),
  ];

  // デフォルト値の設定
  Data _item = _data[0];

  void _setData() {
    setState(() {
      // カスケード記法を用いることで
      // _dataオブジェクトをfirstでの操作でも使わせることができる
      _item = (_data..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // widgetはStatefulWidgetをWrapしたオブジェクトを返すgetter
        title: Text(widget.title),
      ),
      body: Text(
        _item.toString(),
        style: const TextStyle(fontSize: 32.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        tooltip: 'set message.',
        child: const Icon(Icons.star),
      ),
    );
  }
}
