import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/app/home/nav_bar.dart';
import 'package:petroly/custom_widgets/custom_icon_button.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await showInformationDialog(context);
      //   },
      //   child: const Icon(Icons.add),
      //   backgroundColor: Color(0xFF17DE98),
      // ),
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
          SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.center,
            height: 120,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 9.0),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2021-10-3'),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                          ),
                          Text('202')
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ICS254 HW:3-oct',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(FontAwesomeIcons.book, color: Colors.deepPurple),
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
