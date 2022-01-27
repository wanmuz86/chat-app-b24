import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat.dart';
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

// I'm going to use Firebase Authentication

    var _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter your email"),
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Enter your password"),
                obscureText: true,
              ),
              TextButton(onPressed: (){
              //  Navigator.pop(context);
                // When the button is pressed, I will create user in firebase auth
                _auth.createUserWithEmailAndPassword(email: emailController.text,
                    password: passwordController.text).then((value)  {
                      // You can replace this with flutter toast..
                  // Then navigator.pop
                  var user = value.user!;
                  FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                    'email':user.email,
                    'id':user.uid,
                    'createdAt':DateTime.now(),
                    'chatWith':null
                  });
                      print("User succesfully registered");
                      Navigator.pop(context);

                }).catchError((err)=>{
                  print("Something is wrong $err")
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
