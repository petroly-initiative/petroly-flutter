import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:petroly/app/evaluation/instructor_card.dart';
import 'package:petroly/models/Instructor_model.dart';
import 'package:petroly/providers/Instructor_Provider.dart';
import 'package:petroly/providers/Instructors_list.dart';
import 'package:provider/provider.dart';

class Evalation extends StatefulWidget {
  Evalation({Key? key}) : super(key: key);
  @override
  _EvalationState createState() => _EvalationState();
}

class _EvalationState extends State<Evalation> {
  late List<InstructorModel> instructors;
  var _isinit = true;
  void didChangeDependencies() {
    if (_isinit) {
      Provider.of<InstructorList>(context, listen: false).fetchData();
    }
    super.didChangeDependencies();
  }

  String dropdownvalue = 'Department';
  var items = [
    'Department',
    'Course',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple',
  ];

  @override
  Widget build(BuildContext context) {
    // instructors = context.read<InstructorProviderx>().instructors;
    instructors = Provider.of<InstructorList>(context).instructors;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.black12,
              filled: true,

              // labelText: 'Enter your instructor name ',
              hintText: 'Look for your Instructor ',
              // hintStyle: TextStyle(fontFamily: 'Droid'),
              // hintText: 'Ex.Mohammad Ahmad',
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(height: 26.0),
          Center(
            child: Row(
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
                    value: dropdownvalue,
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
                        dropdownvalue = newValue!;
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
                    value: dropdownvalue,
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
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: instructors.length,
                itemBuilder: (ctx, index) {
                  return InstructorCard(instructors[index]);
                }),
          )
        ],
      ),
    );
  }
}
