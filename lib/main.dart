import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_practice/root/root_app.dart';
import 'package:login_practice/utilities/constrains.dart';


void main(){
  runApp(RootApp());
}



class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoute,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme:ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: thirdColor,
        ),

      ),
    );
  }
}
