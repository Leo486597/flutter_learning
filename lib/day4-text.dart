import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

Future<String> getSWData() async {
  final url = "https://swapi.co/api/starships";
  String data;

  var res = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var resBody = json.decode(res.body);
  data = resBody["results"].toString();

  return data;
}

class _SampleAppPageState extends State<SampleAppPage> {
  String _exchangeCtx = 's';
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    getSWData().then((val) {
      setState() {
        _exchangeCtx = val;
        _loading = false;
      }
    });
    print(_exchangeCtx);
  }

  @override
  build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new Center(child: new Text("dsfsdf")))
        // floatingActionButton: new FloatingActionButton(
        //   onPressed: _updateText,
        //   tooltip: 'Update Text',
        //   child: new Icon(Icons.update),
        // ),
        );
  }
}
