import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_flutter_darkmode_provider/helper/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
          child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: notifier.darkMode ? dark_mode : light_mode,
                home: MyHomePage(title: 'Flutter Demo Home Page'),
              );
            }
          ),
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
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container (
              padding: EdgeInsets.only(left:15, right: 15, bottom: 30),
              child: Consumer<ThemeNotifier>(
                  builder: (context,notifier,child) => SwitchListTile(
                  title: Text("Dark Mode"),
                  onChanged: (val){
                    notifier.toggleChangeTheme();
                  },
                  value: notifier.darkMode ,
                ),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
