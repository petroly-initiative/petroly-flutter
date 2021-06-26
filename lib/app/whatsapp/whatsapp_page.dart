import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/app/home/nav_bar.dart';
import 'package:petroly/custom_widgets/custom_icon_button.dart';

import 'add_group_form.dart';

class Whatsapp extends StatefulWidget {
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: WhatsappPage(),
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showInformationDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFF17DE98),
      ),
    );
  }
}

class WhatsappPage extends StatefulWidget {
  @override
  _WhatsappPageState createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage> {
  String department = 'All';
  var items = [
    'All',
    'SWE',
    'CS',
    'COE',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: DropdownButton(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  dropdownColor: Colors.blueGrey,
                  value: department,
                  iconEnabledColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: SizedBox(
                          width: 100.0,
                          child: Text(items, textAlign: TextAlign.center),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      department = newValue!;
                    });
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: DropdownButton(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  dropdownColor: Colors.blueGrey,
                  value: department,
                  iconEnabledColor: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: SizedBox(
                          width: 100.0,
                          child: Text(items, textAlign: TextAlign.center),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      department = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: 65,
            width: 360,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ICS353 setion 2'),
                Icon(FontAwesomeIcons.solidTimesCircle)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: 65,
            width: 360,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Me2017Lab setion 2'),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.solidThumbsUp),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(FontAwesomeIcons.solidThumbsDown),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
