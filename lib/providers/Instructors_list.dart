import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroly/models/Instructor_model.dart';
import 'dart:convert';
import 'dart:async';

class InstructorList with ChangeNotifier, DiagnosticableTreeMixin {
  List<InstructorModel> _instructors = [];
  List<InstructorModel> get instructors => _instructors.toList();
  int _count = 0;

  int get count => _count;

  void increment() {
    print(_count);
    _count++;
    notifyListeners();
  }

  Future<void> fetchData() async {
    var urlString =
        'https://www.petroly.co/endpoint/?query={instructors{data{id,name,department}}}';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url);
      print(response.body);
      var data = json.decode(response.body);
      // print(data);
      // print(data['data']['instructors']['data']);
      _instructors.clear();
      for (var inst in data['data']['instructors']['data']) {
        _instructors.add(InstructorModel(
            id: int.parse(inst['id']),
            name: inst['name'],
            department: inst['department']));
      }
      // print(_instructors);

      notifyListeners();
      if (response.statusCode >= 400) {
        throw Exception(data['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
