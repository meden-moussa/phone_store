// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_store_linux/auth/inscription.dart';
import 'package:phone_store_linux/auth/password_reset.dart';
import 'package:phone_store_linux/phone_info.dart';
import 'package:phone_store_linux/phones_list.dart';
import 'auth/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          "login": (context) => const LoginPage(),
          "phones": (context) => const PhonesList(),
          "inscription": (context) => const Inscription(),
          "info": (context) => PhoneInfo(),
          "resetPass": (context) => const PasswordReset(),
        },
      ),
    );
  }
}
