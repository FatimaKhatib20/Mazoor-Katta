import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../variable.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({Key? key, required this.onClickedSignUp,}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 100,
                      ),

                      const Text("MAZOOR KATTA ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xF3101047),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,

                        ),),

                      Text("Login to your account",
                        style: TextStyle(
                            fontSize: 15,
                            color:Colors.grey[700]),)
                    ],
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        const Text("Email", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color:Colors.black87
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0,
                                  horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                ),

                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                        ),
                        const SizedBox(height: 10),

                        const Text("Password", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color:Colors.black87
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0,
                                  horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                ),

                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              )
                          ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration:
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),

                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: signIn,
                        color: const Color(0xF3101047),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: const Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                        text: "Do'nt Have An Account?",
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignUp,
                              text: 'Sign Up!',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),

                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 100),
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fitHeight
                      ),
                    ),
                  )

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async{
    uid = '7IwF0z0OoZmSXyMr4mqS';
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
              );
        } on FirebaseAuthException catch (e) {
          print(e);
        }
  }
}
