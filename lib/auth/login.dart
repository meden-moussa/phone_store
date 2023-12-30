// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = FirebaseAuth.instance;
  bool statusMdp = true;
  Icon copright = const Icon(Icons.copyright_rounded);
  final emailContr = TextEditingController();
  final passCntr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        //   centerTitle: true,
        //   title: const Text(
        //     "page login",
        //     style: TextStyle(fontSize: 20),
        //   ),
        // ),
        body: Container(
      padding: const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 30),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: const Image(
                    image: AssetImage(
                      "img/logo.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  "Login ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          // login inputs

          //email :
          TextField(
            controller: emailContr,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Email"),
          ),
          const SizedBox(
            height: 18,
          ),
          //paswword:
          TextField(
            controller: passCntr,
            obscureText: statusMdp,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      statusMdp = !statusMdp;
                    });
                  },
                  child:
                      Icon(statusMdp ? Icons.visibility : Icons.visibility_off),
                ),
                border:
                    const OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Password"),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "resetPass");
                },
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(color: Colors.grey),
                )),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 79, 22),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                try {
                  await auth.signInWithEmailAndPassword(
                      email: emailContr.text, password: passCntr.text);

                  Navigator.pushNamed(context, "phones");
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${e.message}"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text(
                "Log In",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "D'ont have an account?",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 104, 100, 100),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "inscription");
                },
                child: const Text(
                  "Sign Up.",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "By: meden Moussa ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.copyright),
              Text(
                " 2023",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
