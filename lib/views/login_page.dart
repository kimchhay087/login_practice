import 'package:flutter/material.dart';
import 'package:login_practice/widgets/button_widget.dart';
import 'package:login_practice/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              SizedBox(height: 26),
              TextFormFieldWidget(
                isPassword: false,
                labelText: 'Email',
                hintText: 'Enter your email address',
                prefixIcon: Icon(Icons.mail),
                controller: _emailController,
              ),
              SizedBox(height: 26),
              TextFormFieldWidget(
                isPassword: true,
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                controller: _passwordController,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ButtonWidget(
                title: 'Log In',
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed(
                      '/home',
                      arguments: {
                        'email': _emailController.text,
                        'password': _passwordController.text,
                      },
                    );
                  }
                },
                borderColor: colorScheme.tertiary,
                textColor: colorScheme.secondary,
                backgroundColor:
                    MaterialStateProperty.all<Color>(colorScheme.tertiary),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: (context),
        builder: (context) {
          final colorScheme = Theme.of(context).colorScheme;
          return FractionallySizedBox(
            heightFactor: 0.94,
            child: SafeArea(
              child: Container(
                color: colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 36,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Find your account',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 16),
                      Text('Enter your mobile number or email address.'),
                      SizedBox(height: 16),
                      TextFormFieldWidget(
                        isPassword: false,
                        labelText: 'Mobile number or Email',
                      ),
                      SizedBox(height: 16),
                      ButtonWidget(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colorScheme.tertiary),
                          textColor: colorScheme.secondary,
                          title: 'Find account',
                          onPress: () {},
                          borderColor: colorScheme.tertiary),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
