import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edi_final/worker/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class viewJ extends StatefulWidget {
  const viewJ({Key? key}) : super(key: key);

  @override
  State<viewJ> createState() => _viewJState();
}

class _viewJState extends State<viewJ> {

  navigatetoDetail(DocumentReference job){
    Navigator.push(context, MaterialPageRoute(builder: (context)  => deets()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('jobs_data').snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text('Something went wrong');
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
                        onTap: ()=> navigatetoDetail(document['foreign']),
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