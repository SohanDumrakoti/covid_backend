import 'dart:convert';

import 'package:coronatracker/constant.dart';
import 'package:coronatracker/data/token_Storage.dart';
import 'package:coronatracker/models/user_model.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future login(UserModel user) async {
    try {
      final url = Uri.parse(Constants.baseUrl + "login");
      final res = await http.post(
        url,
        body: {
          "email": user.email,
          "password": user.password,
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        print(data);
        UserModel userd = UserModel.fromJson(data);
        await TokenStorage.saveToken(userd.token!);
        return "success";
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> register(UserModel user) async {
    try {
      final url = Uri.parse(Constants.baseUrl + "register");
      final res = await http.post(url, body: {
        "email": user.email,
        "password": user.password,
      });
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return data[0];
      } else {
        return Future.error("Error occurred");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future logout() async {
    await TokenStorage.deleteToken();
    return "Logged out";
  }
}
