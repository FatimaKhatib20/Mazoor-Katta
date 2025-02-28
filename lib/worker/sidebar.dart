import 'package:edi_final/worker/editworprof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common_scr/main.dart';

class sideBar extends StatelessWidget {
  const sideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 16,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color(0xFF16077C),),
                  child: const Align(
                    alignment: AlignmentDirectional(-1, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text('Hello,', textAlign: TextAlign.start, style: TextStyle(fontSize: 70,color: Color(0xFFF5F5F5),fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1,-1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child:
                        ListTile(
                          leading: const Icon(
                            Icons.account_circle_rounded,
                            size: 40,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute( builder: (context) => const worProf(),),);
                          },
                          title:
                          const Text("Edit \nProfile", style: TextStyle(fontSize: 25,fontFamily: 'Roboto')),
                          trailing: const Icon(
                            Icons.arrow_right_sharp,
                            color: Color(0xFF303030),
                            size: 40,
                          ),
                          tileColor: const Color(0xFFF5F5F5),
                          dense: false,
                          contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.account_balance_wallet,
                        size: 35,
                      ),
                      title: Text(
                          'Payment History',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 25,fontFamily: 'Roboto')
                      ),
                      trailing: Icon(
                        Icons.arrow_right_sharp,
                        color: Color(0xFF303030),
                        size: 40,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 290, 0, 0),
                        child:
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 70,
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          color: const Color(0xFF16077C),
                          elevation: 0,
                          child: const Text(
                            "Logout", style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.white,

                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])
    );
  }
}

