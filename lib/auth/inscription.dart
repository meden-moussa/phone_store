// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final auth = FirebaseAuth.instance;
  bool statusMdp = true;
  bool statusMdp2 = true;
  Icon copright = const Icon(Icons.copyright_rounded);
  final emailContr = TextEditingController();
  final passCntr = TextEditingController();
  final confPassCntr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Inscrption ",
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

          const SizedBox(
            height: 18,
          ),
          //confirmed password
          TextField(
            controller: confPassCntr,
            obscureText: statusMdp2,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      statusMdp2 = !statusMdp2;
                    });
                  },
                  child: Icon(
                      statusMdp2 ? Icons.visibility : Icons.visibility_off),
                ),
                border:
                    const OutlineInputBorder(borderSide: BorderSide(width: 1)),
                hintText: "Confirme password"),
          ),

          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 13, 79, 22),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (passCntr.text != confPassCntr.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("passwords do not matchs"),
                    backgroundColor: Colors.red,
                  ));
                }

                try {
                  await auth.createUserWithEmailAndPassword(
                      email: emailContr.text, password: passCntr.text);

                  Navigator.pushNamed(context, "Login");
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${e.message}"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text(
                "Sign Up",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: const Text(
                  "Log in.",
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
