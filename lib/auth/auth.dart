import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/API/API.dart';
import 'package:kanban/card_screen.dart';
import 'package:kanban/models/user_model.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'login_service.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            top: true,
            child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  title: Text("Kanban"),
                  backgroundColor: Colors.grey[850],
                ),
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Form(
                        key: _formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length < 4) {
                                        return "Minimum is 4 characters";
                                      } else if (value != "armada") {
                                        return "Wrong username";
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                    controller: _username,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        hintText: "Enter your username",
                                        labelStyle:
                                            TextStyle(color: Colors.grey)),
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return "Minimum is 6 characters";
                                      } else if (value != "FSH6zBZ0p9yH") {
                                        return "Wrong password";
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                    controller: _password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        hintText: "Enter your password",
                                        labelStyle:
                                            TextStyle(color: Colors.black)),
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    !_formkey.currentState!.validate();
                                    Map<String, dynamic>? user =
                                        await ApiService().loginUser(
                                            _username.text, _password.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.tealAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      )),
                                  child: Text("Log in",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ]))))));
  }
}
