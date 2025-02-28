
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../variable.dart';

class jobFetch extends StatefulWidget {
  const jobFetch({Key? key}) : super(key: key);

  @override
  State<jobFetch> createState() => _jobFetchState();
}

class _jobFetchState extends State<jobFetch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('employer').doc('7IwF0z0OoZmSXyMr4mqS').collection('jobs').snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return ListView(
                children: snapshot.data!.docs.map((document){
                    return Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x95B7BDBD),
                            ),
                            width: MediaQuery.of(context).size.width/1.1,
                            height : 80,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                    child: Text(
                                      document['title'],
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF19195A),
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                          onTap: (){},
                        ),
                      ),
                    );
                }).toList(),
              );
            }
          }),
    );
  }
}
