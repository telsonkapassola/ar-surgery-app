import 'package:firebase_auth/firebase_auth.dart';
import 'package:surgery_ar_app/views/homeView.dart';
import 'package:surgery_ar_app/views/login/loginView.dart';
import 'package:surgery_ar_app/views/onboarding/onboardingView.dart';
import 'package:surgery_ar_app/views/signup/signupView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 import 'firebase_options.dart';
 import 'views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OperAR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle:
                  GoogleFonts.nunito(color: Colors.black, fontSize: 20))),
      home: OnBoardingPage(),
    );
  }
}
