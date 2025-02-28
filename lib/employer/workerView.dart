import 'package:flutter/material.dart';

class wor_View extends StatefulWidget {
  const wor_View({Key? key}) : super(key: key);

  @override
  State<wor_View> createState() => _wor_ViewState();
}

class _wor_ViewState extends State<wor_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Siddhi Chavan \n Contact: 9876543212',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xFF01011C),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Amogh Dixit \nContact: 9876543212',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xFF01011C),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )

        )

    );
  }
}
