import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/auth/auth.dart';
import 'package:kanban/models/user.dart';
import 'package:kanban/packages/authentication_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
