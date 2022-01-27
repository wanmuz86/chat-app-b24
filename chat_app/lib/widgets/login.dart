import 'package:chat_app/widgets/chat.dart';
import 'package:chat_app/widgets/forgot_password.dart';
import 'package:chat_app/widgets/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Enter your password"),
                obscureText: true,
              ),
              TextButton(onPressed: (){
                _auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text).then((value) => {
                      Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ChatPage(userId: value.user!.uid,)))

                }).catchError((err)=>{
                  // Create FlutterToast to tell user error/wrong password
                  print(err)
                });
               //
              }, child: Text("Login"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),

                  ),
              TextButton(onPressed: (){
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> RegisterPage()));
                
              }, child: Text("No Account? Sign Up!")),
              TextButton(onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage())
                );
                
              }, child: Text("Forgot Password!"))
            ],
          ),
        ),
      ),
    );
  }
}
