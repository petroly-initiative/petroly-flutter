import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/app/evaluation/evaluation.dart';
import 'package:petroly/app/whatsapp/whatsapp_page.dart';
import 'nav_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Icon(FontAwesomeIcons.stumbleuponCircle),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                FontAwesomeIcons.solidUserCircle,
                size: 36,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: NavBar(),
      body: HomePage(),
      backgroundColor: Colors.grey[200],
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('home Screen'),
    Text('chat Screen'),
    Evalation(),
    Whatsapp(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black87,
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  'Home',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                title: Text(
                  'Chat',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidEdit),
                title: Text(
                  'Evaluation',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.whatsapp),
                title: Text(
                  'Whatsapp',
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            selectedFontSize: 13.0,
            unselectedFontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
