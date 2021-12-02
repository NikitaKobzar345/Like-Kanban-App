import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kanban/card_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  Dio dio = new Dio();

  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjM3MDUxNzg0LCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjM3MDQ4MTg0fQ.bruT6GdbYVrFYkI2tULpzA8-LTDRU1S5PoAy9aUq8w4";

  var refresh_token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjM2ODk3NjQyLCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjM2ODkyNTE5fQ.hPcXRreU1KLk3PIasnssx2ibFoVHgZ7HFNxkD-6usW8";

  Future getUserCards() async {
    try {
      Response resp;

      var get_cards = "https://trello.backend.tests.nekidaem.ru/api/v1/cards/";
      resp = await dio.get(get_cards);
      dio.options.headers["Authorization"] = "Bearer ${token}";
      dio.options.headers['Content-Type'] = "application/json";
      var json = (resp.data);
      var value = json["id"]["row"]["seq_num"]["text"];
      return value;
    } catch (e) {
      print(e);
    }
  }

  Future loginUser(String username, String password) async {
    var storage = new FlutterSecureStorage();
    await storage.write(key: 'JWT', value: token);

    var login = "https://trello.backend.tests.nekidaem.ru/api/v1/users/login/";

    final data = {"username": username, "password": password};

    Response response;
    response = await dio.post(login, data: data);

    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers['Content-Type'] = "application/json";

    if (response.statusCode == 200) {
      Get.to(CardScreen());
      return response.data;
    } else if (response.statusCode == 401) {
      var refreshToken = await dio.post(
          "https://trello.backend.tests.nekidaem.ru/api/v1/users/refresh_token/");

      response = await dio.post(refresh_token, data: data);

      dio.options.headers["Authorization"] =
          "Bearer ${token},'Content-Type': 'application/json','refresh_token': '$refresh_token'";

      storage = response.data["token"];
      refresh_token = response.data["refresh_token"];

      return loginUser("armada", "FSH6zBZ0p9yH");
    } else
      return null;
  }
}
