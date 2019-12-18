import 'package:ch2_my_counter/instructions.dart';
import 'package:ch2_my_counter/maximum_bid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        canvasColor: Colors.lightGreen.shade100,
        platform: TargetPlatform.android,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    SharedPreferences.setMockInitialValues({});
  }

  void _updateSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times');
    setState(() {
      _counter = counter;
    });
    await prefs.setInt('counter', counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('Counter: $_counter'),
          Theme(
            // Unique theme with ThemeData - Overwrite
            data: ThemeData(
              cardColor: Colors.deepOrange,
            ),
            child: Card(
              child: Text('Unsique ThemeData'),
            ),
          ),
          Theme(
            // copyWith Theme - Inherit (Extended)
            data: Theme.of(context).copyWith(cardColor: Colors.deepOrange),
            child: Card(
              child: Text('copyWith Theme'),
            ),
          ),
          Instructions(),
          Divider(),
          MaximumBid()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateSharedPreferences,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
