import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  var emailController = TextEditingController();
  var _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              TextButton(onPressed: (){
                _auth.sendPasswordResetEmail(email: emailController.text).then((value) =>
                {
                  //TO DO - create toast
                Navigator.pop(context)
                });


              }, child: Text("Register"),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
