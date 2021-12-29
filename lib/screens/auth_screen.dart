import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:login_test/model/user.dart';
import 'package:login_test/screens/welcome_screen.dart';
import 'package:login_test/widgets/auth_form.dart';
import 'package:login_test/widgets/background.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AutoGenerate _user;
  var _isLoading = false;
  var _isLoggedIn = false;
  Color _particleColor = Colors.blue;

  void _submitAuthForm(
    String username,
    String password,
    BuildContext ctx,
  ) async {
    setState(() {
      _isLoading = true;
    });
    String url = "https://api.getcountapp.com/api/v1/authenticate";
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }));

    if (response.statusCode == 200) {
      _particleColor = Colors.green;
      _user = AutoGenerate.fromJson((json.decode(response.body)));
      setState(() {
        _isLoading = false;
        _isLoggedIn = true;
      });
    } else if (response.statusCode == 401) {
      _particleColor = Colors.red;
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: const Text('Wrong username or password'),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(_particleColor),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: _isLoggedIn
              ? GlassFloatingActionButton(
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLoggedIn = !_isLoggedIn;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('User logged out'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                    _particleColor = Colors.blue;
                  })
              : null,
          body: _isLoggedIn
              ? WelcomeScreen(user: _user)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Simple Flutter login test",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    AuthForm(
                      _submitAuthForm,
                      _isLoading,
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
