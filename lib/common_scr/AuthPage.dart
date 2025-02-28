import 'package:edi_final/common_scr/login_scr.dart';
import 'package:edi_final/common_scr/signup_scr.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin =true;
  @override
  
  Widget build(BuildContext context) =>isLogin
        ? LoginPage(onClickedSignUp: toggle,)
        : SignUpPage(onClickedLogIn: toggle);
  void toggle() =>setState(()=>isLogin=!isLogin);
}
