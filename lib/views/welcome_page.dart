import 'package:flutter/material.dart';
import 'package:login_practice/widgets/button_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme =Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: colorScheme.primary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 36),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 50),
                  ButtonWidget(
                    title: 'Log In',
                    textColor: Colors.black,
                    onPress: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFFFE401),
                    ),
                    borderColor: Colors.white,
                  ),
                  SizedBox(height: 32),
                  ButtonWidget(
                    title: 'Register',
                    onPress: () {},
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    borderColor: Colors.black,
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
