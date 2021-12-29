import 'package:flutter/material.dart';
import 'package:login_test/model/user.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({required this.user, Key? key}) : super(key: key);
  final AutoGenerate user;
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue, width: 5),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          color: Colors.white54,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.user.user.firstName +
                        ' ' +
                        widget.user.user.lastName,
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Country: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Image.asset(
                      "icons/flags/png/" +
                          widget.user.user.country.toLowerCase() +
                          ".png",
                      package: 'country_icons'),
                ],
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Administrator? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(widget.user.user.userRole.isAdministrator
                      ? Icons.check
                      : Icons.clear),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.user.user.email,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'Language: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.user.user.language,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
