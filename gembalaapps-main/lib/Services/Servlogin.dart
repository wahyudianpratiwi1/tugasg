import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// PostLogin postLoginFromJson(String str) => PostLogin.fromJson(json.decode(str));

// String postLoginToJson(PostLogin data) => json.encode(data.toJson());

class PostLogin {
  final String? username;
  final String? password;

  PostLogin({this.username, this.password});
  // factory PostLogin.fromJson(Map<String, dynamic> json) {
  //   return PostLogin(
  //     username: json['username'] as String,
  //     password: json['password'] as String,
  //   );
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }

  @override
  String toString() {
    return 'PostLogin{username: $username, password: $password}';
  }

  factory PostLogin.createdPostLogin(Map<String, dynamic> object) {
    return PostLogin(
      username: object['username'],
      password: object['password'],
    );
  }
}

class LoginResponse {
  bool? status;
  String? error;
  Data? data;

  LoginResponse({this.status, this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] == "200" ? true : false;
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? expiresAt;

  Data({this.token, this.expiresAt});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresAt'] = this.expiresAt;
    return data;
  }
}

Future<Data> postConnectToApi(String username, String password) async {
  String _idtoken;
  String _expiresAt;
  bool isAuth;
  String apiURL = "https://be.gembala.sembadafarm.com/api/auth/login";

  var response = await http.post(Uri.parse(apiURL), body: {
    "username": username,
    "password": password,
  });
  if (response.statusCode == 200) {
    var jsonObject = json.decode(response.body);
    //sharedpreferemces
    _idtoken = jsonObject['data']['token'];
    _expiresAt = jsonObject['data']['expiresAt'];
    final pref = await SharedPreferences.getInstance();
    final mytoken = pref.setString('token', _idtoken);
    final myexp = pref.setString('expiresAt', _expiresAt);
    DateTime myexpiresAt = DateTime.parse(_expiresAt);

    if (_idtoken != null &&
        myexpiresAt != null &&
        myexpiresAt.isAfter(DateTime.now())) {
      isAuth = true;
    } else {
      isAuth = false;
    }

    print("resulttt: ${response}");

    print("Response login : ${response.body.toString()}");
    print("_expiresAt : $_expiresAt");
    return Data.fromJson(jsonObject);
  } else {
    print("Response login : ${response.body.toString()}");
    Fluttertoast.showToast(
        msg: "Username atau password salah",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        textColor: Colors.white,
        fontSize: 12.0);
    return Data.fromJson(json.decode(response.body));
  }
}

Future<void> autologin(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  final mytoken = pref.getString('token');
  final myexp = pref.getString('expiresAt');
  DateTime myexpiresAt = DateTime.parse(myexp!);
  DateTime nowDate = DateTime.now();

  if (nowDate.isBefore(myexpiresAt)) {
    print('Sudah loginn broo >>>>');
    Navigator.pushNamed(context, '/dashboard');
  } else {
    print('Belum login bro >>>>');
  }
}
