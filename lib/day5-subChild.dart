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
        primarySwatch: Colors.red,
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
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
          onPressed: () => {}, child: new Text('Toggle Twos'));

      // return new Text('Toggle Two');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        // promagable return the child
        // pass parent a method
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        // trigger the setState function
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.change_history),
      ),
    );
  }
}
