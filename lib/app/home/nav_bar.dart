import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            'nawaf  alfaifi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent,
            ),
          ),
          accountEmail: Text('test@test.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'assets/images/blank_profile.png',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/Group 98.png',
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.solidUser),
          title: Text('Profile'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.medal),
          title: Text('Badges'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.list),
          title: Text('My Evaluations'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.solidBookmark),
          title: Text('Bookmarks'),
        ),
        Divider(
          color: Colors.black87,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => null,
        ),
      ],
    ));
  }
}
