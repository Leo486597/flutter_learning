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
      title: 'My App',
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

class _SampleAppPageState extends State<SampleAppPage> {
  final url = "https://swapi.co/api/starships";
  bool _loading = false;
  String shareData = 'no data';

  @override
  void initState() {
    super.initState();
  }

  @override
  build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mt App"),
      ),
      body: new Center(child: new Text(shareData)),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: getSWData(),
      //   tooltip: 'Update Text',
      //   child: new Icon(Icons.update),
      // ),
    );
  }

  getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    String data = resBody["results"].toString();

    if (data != null) {
      setState(() {
        shareData = data;
      });
    }
  }
}
