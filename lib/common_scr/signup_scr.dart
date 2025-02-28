import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edi_final/variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onClickedLogIn;

  const SignUpPage({Key? key, required this.onClickedLogIn,}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  late final data;


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordcontroller.dispose();
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (confirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      addUserDetails(

          nameController.text.trim(),
          emailController.text.trim(),
          int.parse(ageController.text.trim()));
    }
  }

  Future addUserDetails(String name, String email, int age) async{
    if(isemployer()){
      data = {
        'name': name,
        'age': age,
        'email': email,
      };
      DocumentReference docRef =await FirebaseFirestore.instance.collection('employer').add(data);
      print(docRef.id);
      uid = docRef.id;

    }
    else{
      data = {
        'name': name,
        'age': email,
        'email': age,
      };

      DocumentReference docRef = await FirebaseFirestore.instance.collection('worker').add(data);
      print(docRef.id);
      uid = docRef.id;
    }
  }
  bool isemployer(){
    if(int.parse(ageController.text.trim())>40){
      return true;
    }
    else{
      return false;
    }
  }



  bool confirm(){
    if(passwordController.text.trim() == confirmpasswordcontroller.text.trim()){
      return true;
    }
    else{
      return false;
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xF3101047),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Welcome New User!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:Colors.black87
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
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
                  const Text(
                    'Age',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:Colors.black87
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: ageController,
                    textInputAction: TextInputAction.next,
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
                  const Text(
                    'Email',
                    style: TextStyle(
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
                  const Text(
                    'Password',
                    style: TextStyle(
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
                  const SizedBox(height: 10),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:Colors.black87
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: confirmpasswordcontroller,
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
                ],
              ),
              Container(
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
                  onPressed: signUp,
                  color:const Color(0xF3101047),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: const Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedLogIn,
                        text: 'Login!',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
