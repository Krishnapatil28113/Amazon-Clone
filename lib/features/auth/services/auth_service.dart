import 'dart:convert';

import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_variables.dart';

class AuthService {
  // signing up the user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = new User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: 'user',
        token: '',
      );

      var url = Uri.parse('$uri/api/signup');
      http.Response res = await http.post(url,
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created, login with the same credentials!',
            );
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var url = Uri.parse('$uri/api/signin');
      http.Response res = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
              'x-auth-token',
              jsonDecode(res.body)["token"],
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  // get User Data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // This will basically give us a token
      String? token = prefs.getString('x-auth-token');

      // If the user logs in for the first time
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http
          .post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get user data
        http.Response userRes =
            await http.get(Uri.parse('$uri/'), headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}
