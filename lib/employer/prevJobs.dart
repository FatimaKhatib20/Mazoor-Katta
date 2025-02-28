import 'package:flutter/material.dart';

class prev_jobs extends StatefulWidget {
  const prev_jobs({Key? key}) : super(key: key);

  @override
  State<prev_jobs> createState() => _prev_jobsState();
}

class _prev_jobsState extends State<prev_jobs> {
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
                  height: 80,
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
                            'Cleaning House',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF01011C),
                              fontSize: 28,
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
                  height: 80,
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
                            'Banquet Waiters',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF01011C),
                              fontSize: 28,
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
