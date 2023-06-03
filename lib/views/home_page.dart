import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.arguments}) : super(key: key);

  final Map<String, dynamic>? arguments;

  @override
  Widget build(BuildContext context) {
    final String? email = arguments?['email'];
    final String? password = arguments?['password'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: ${email}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Password: ${password}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
