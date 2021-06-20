import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petroly/models/Instructor_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:petroly/models/user_model.dart';

class Auth with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  late UserModel _user;

  int get count => _count;
  UserModel get user => _user;

  void increment() {
    print(_count);
    _count++;
    notifyListeners();
  }

  Future<bool> login(String password, String username) async {
    String log =
        'mutation {tokenAuth(password:"$password",username:"$username"){success,errors,user{username,id,email,firstName,lastName,profile{profilePic}}}}';
    final headers = {
      "Content-Type": "application/json; charset=utf-8",
    };
    var urlString = 'https://www.petroly.co/endpoint/';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url,
          headers: headers, body: json.encode({'query': log}));
      print(response.body);
      var data = json.decode(response.body);
      // print(data);
      if (response.statusCode >= 400) {
        throw Exception(data['message']);
      }
      var userdata = data['data']['tokenAuth']['user'];
      _user = UserModel(
          id: userdata['id'],
          username: userdata['username'],
          firstName: userdata['firstName'],
          lastName: userdata['lastName'],
          profilePic: 'https' +
              userdata['profile']['profilePic'].toString().substring(4),
          email: userdata['email']);
      return (data['data']['tokenAuth']['success']) as bool;
    } catch (error) {
      return false;
      // throw error;
    }
  }

  Future<bool> signup(
      String email, String username, String password1, String password2) async {
    String log =
        'mutation {register(email:"$email",username:"$username",password1:"$password1",,password2:"$password2"){success,errors}}';
    final headers = {
      "Content-Type": "application/json; charset=utf-8",
    };
    var urlString = 'https://www.petroly.co/endpoint/';
    var url = Uri.parse(urlString);
    try {
      var response = await http.post(url,
          headers: headers, body: json.encode({'query': log}));
      print(response.body);
      var data = json.decode(response.body);
      // print(data);
      if (response.statusCode >= 400) {
        throw Exception(data['message']);
      }
      // var userdata = data['data']['register']['user'];
      // _user = UserModel(
      //     id: userdata['id'],
      //     username: userdata['username'],
      //     firstName: userdata['firstName'],
      //     lastName: userdata['lastName'],
      //     profilePic: 'https' +
      //         userdata['profile']['profilePic'].toString().substring(4),
      //     email: userdata['email']);
      return (data['data']['register']['success']) as bool;
    } catch (error) {
      return false;
      // throw error;
    }
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
