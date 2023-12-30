import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final emailContr = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 30),
        child: ListView(children: [
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
                  "Password Reset ",
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

          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 79, 22),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                try {
                  await auth.sendPasswordResetEmail(
                    email: emailContr.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('success, check your email adresss'),
                    ),
                  );

                  Navigator.pushNamed(context, "login");
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${e.message}"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text(
                "send to email",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "login");
            },
            child: const Text(
              "Log in.",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),

          const SizedBox(
            height: 80,
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
        ]),
      ),
    );
  }
}
