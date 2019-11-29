import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieRouting(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('page1'),);
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('page2'),);
  }
}
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('page3'),);
  }
}
class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('page4'),);
  }

}

class MovieRouting extends StatefulWidget {
  @override
  MovieRoutingState createState() => new MovieRoutingState();
}

// SingleTickerProviderStateMixin is used for animation
class MovieRoutingState extends State<MovieRouting> with SingleTickerProviderStateMixin {
  int i = 0;
  int _pState = 0;
  var pages = [new Page1(), new Page2(), new Page3(), new Page4()];

  @override
  void initState() {
    super.initState();
  }
  Future<bool> _onWillPop() {
    setState(() {
      i=_pState;
    });


  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop ,
      child: new Scaffold(
        body: pages[i],
        // drawer: new AppNavigationDrawer(),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('page 1'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.photo_library),
              title: new Text('page 2'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.book),
              title: new Text('page 3'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.notifications),
              title: new Text('page 4'),
            ),
          ],
          currentIndex: i,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            print (index);
            setState(() {
              _pState = i;
              i = index;

            });
          },
        ),
      ),
    );

  }
}