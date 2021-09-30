import 'package:feedback_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(primarySwatch: Colors.orange),
    ),
  );
}
