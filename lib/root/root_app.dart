import 'package:flutter/material.dart';
import 'package:login_practice/views/home_page.dart';
import 'package:login_practice/views/login_page.dart';
import 'package:login_practice/views/splash_page.dart';
import 'package:login_practice/views/welcome_page.dart';


Route<dynamic> AppRoute(settings){
  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (context)=> SplashPage());
    case '/welcome':
      return MaterialPageRoute(builder: (context)=> WelcomePage());
    case '/login':
      return MaterialPageRoute(builder: (context)=> LoginPage());
    case '/home':
      final arguments = settings.arguments as Map<String, dynamic>?;
      return MaterialPageRoute(builder: (context)=>HomePage(arguments: arguments));
    default:
      return MaterialPageRoute(builder: (context)=> SplashPage());
  }
}