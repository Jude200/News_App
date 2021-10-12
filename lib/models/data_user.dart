import 'dart:convert';

import 'package:flutter/material.dart';

class UserData {
  int id;
  String name;
  String email;
  String password;
  String date;
  UserData({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'date': date,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
