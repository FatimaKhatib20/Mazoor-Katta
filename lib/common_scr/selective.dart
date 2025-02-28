import 'package:edi_final/employer/empl_home.dart';
import 'package:edi_final/worker/wor_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sel extends StatelessWidget {
  const Sel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Container(

            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/workers.png")
                      )
                  ),
                ),

                Column(
                  children: <Widget>[
                    const Text("Signed In As",style:TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(user.email!,style:const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 20,
                    ),
                    // the login button
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EmpHome()));

                      },
                      // defining the shape
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Login As Employer",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
                    // creating the signup button
                    const SizedBox(height:20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const work_home()));

                      },
                      color: const Color(0xF3101047),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Login As Worker",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
