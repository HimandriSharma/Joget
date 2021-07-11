import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joget',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'FrederickatheGreat'
        ),
      home: MyHomePage(title: 'Joget'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 20;
  int _total = 0;
  int _currentIndex = 0;
  void _decrementCounter() {
    setState(() {
      if(_counter>0){_counter--;_total++;}
      else{_counter=20;}
      
    });
  }
  dynamic func(int val){
    if (val==0){
      return Scaffold(
        body :Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Remainig Applications for today',
              ),
              Text(
                '$_counter',
                // style: TextStyle(fontSize: 50),
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: Icon(Icons.horizontal_rule_outlined),
        ),
      );
    }
    else{
      return Scaffold(
        body :Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total Applications Submitted',
              ),
              Text(
                '$_total',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: func(_currentIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
         BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Pending',            
         ),
         BottomNavigationBarItem(
            icon: Icon(Icons.whatshot_rounded),
            label: 'Completed'
         )
        ],
        onTap: (index){
          setState(() {
            _currentIndex= index;
          });
        },
      ),
    );
  }
}
