import 'package:e_commerce_app_mvc/Models/Products.dart';
import 'package:e_commerce_app_mvc/Screens/OTP.dart';
import 'package:e_commerce_app_mvc/Screens/favorites.dart';
import 'package:e_commerce_app_mvc/Screens/forgot_password.dart';
import 'package:e_commerce_app_mvc/Screens/log_in.dart';
import 'package:e_commerce_app_mvc/Screens/products.dart';
import 'package:e_commerce_app_mvc/Screens/profile.dart';
import 'package:e_commerce_app_mvc/Screens/register.dart';
import 'package:e_commerce_app_mvc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/complete_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options: DefaultFirebaseOptions.currentPlatform;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/LogIn': (context) => const LogIn(),
        '/CompleteProfile': (context) => const CompleteProfile(),
        '/ForgotPassword': (context) => const ForgotPassword(),
        //'/splashPage': (context) => const splashPage(),
        '/Register': (context) => const Register(),
        '/OTP': (context) => const OTP(),
        '/Products': (context) => const Products(),
        '/Profile': (context) => const Profile(),
        '/Favorites': (context) => const Favorites(),
      },
      home: LogIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}