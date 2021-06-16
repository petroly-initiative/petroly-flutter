import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroly/models/Instructor_model.dart';
import 'dart:convert';
import 'dart:async';

class InstructorProviderx with ChangeNotifier, DiagnosticableTreeMixin {
  List<InstructorModel> _instructors = [
    InstructorModel(id: 1, name: "Ali", department: '')
  ];
  List<InstructorModel> get instructors => _instructors;
  int count = 1;
  Future<void> fetchData() async {
    var urlString =
        'https://www.petroly.co/endpoint/?query={instructors(limit:5){data{id,name}}}';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url);
      print(response.body);
      var data = json.decode(response.body);
      print(data);
      notifyListeners();
      if (response.statusCode >= 400) {
        throw Exception(data['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  // List<Instructor> get instructors {
  //   return _instructors;
  // }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
