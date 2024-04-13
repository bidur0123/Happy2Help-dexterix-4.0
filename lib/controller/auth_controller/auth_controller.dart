import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:happy2help/Screens/BaseScreen/base_screen.dart';
import 'package:happy2help/models/user_model.dart';
import 'package:happy2help/providers/user_provider.dart';
import 'package:happy2help/utils/api.dart';
import 'package:happy2help/utils/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserModel user = UserModel(
        id: '',
        email: email,
        name: name,
        token: '',
        password: password,
      );

      http.Response res = await http.post(
        Uri.parse('${Api.uri}/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBaaar(
              context, 'Account created! Login with the same credentials');
        },
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BaseScreen()),
          (route) => false);
    } catch (e) {
      showSnackBaaar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Api.uri}/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      print('Response body: ${res.body}');

      navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BaseScreen()),
              (route) => false);

      // Check if the response body is not null or empty before setting the user
      if (res.body != null && res.body.isNotEmpty) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBaaar(context, 'Welcome Back');
           // SharedPreferences prefs = await SharedPreferences.getInstance();
          //  userProvider.setUser(res.body);
         //   await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
         //    navigator.pushAndRemoveUntil(
         //        MaterialPageRoute(builder: (context) => const BaseScreen()),
         //            (route) => false);
          },
        );
      } else {
        showSnackBaaar(context, 'Error: Empty response from server');
      }
    } catch (e) {
      showSnackBaaar(context, e.toString());
    }
  }


  // get user data

  void getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Api.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-auth-token': token!,
        },
      );
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Api.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-auth-token': token,
          },
        );
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBaaar(context, e.toString());
    }
  }
}
