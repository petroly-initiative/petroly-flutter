import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroly/models/Instructor_model.dart';
import 'dart:convert';
import 'dart:async';

class InstructorList with ChangeNotifier, DiagnosticableTreeMixin {
  String searchValue = '';
  List<InstructorModel> _instructors = [];
  List<InstructorModel> get instructors {
    if (searchValue == '') {
      return _instructors.toList();
    } else {
      return _instructors
          .where((element) =>
              element.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    }
  }

  int _count = 0;

  int get count => _count;

  void increment() {
    print(_count);
    _count++;
    notifyListeners();
  }

  void search(String subName) {
    searchValue = subName;
  }

  Future<void> fetchData() async {
    var urlString =
        'https://www.petroly.co/endpoint/?query={instructors{data{id,name,department,profilePic,evaluationSet{count}}}}';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url);
      // print(response.body);
      var data = json.decode(response.body);
      // print(data);
      // print(data['data']['instructors']['data']);
      _instructors.clear();
      for (var inst in data['data']['instructors']['data']) {
        _instructors.add(InstructorModel(
            id: int.parse(inst['id']),
            name: inst['name'],
            profilePic: inst['profilePic'],
            evalCount: (inst['evaluationSet']['count']),
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

  Future<void> fetchDep() async {
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

  Future<List<String>> fetchComments(int id) async {
    var urlString =
        'https://www.petroly.co/endpoint/?query={evaluations(where : {instructor : {id : {equals:$id}} }) {data{comment}} }';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url);
      // print(response.body);
      var data = json.decode(response.body);
      // print(data);
      // print(data['data']['evaluations']['data']);
      List<String> comments = [];
      for (var comment in data['data']['evaluations']['data']) {
        if (comment['comment'] != '') {
          comments.add(comment['comment']);
        }
      }
      return comments;
      // print(_instructors);

      // notifyListeners();
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
