import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buscador_gifs/ui/home.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
          hintColor: Colors.white,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))))));
}
