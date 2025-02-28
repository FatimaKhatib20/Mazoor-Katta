import 'package:edi_final/employer/emp_sidebar.dart';
import'package:flutter/material.dart';
import 'package:edi_final/employer/jobsView.dart';
import 'package:edi_final/employer/workerView.dart';
import 'package:edi_final/employer/prevJobs.dart';

class EmpHome extends StatefulWidget {
  const EmpHome({Key? key}) : super(key: key);

  @override
  State<EmpHome> createState() => _EmpHomeState();
}

class _EmpHomeState extends State<EmpHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF16077C),
            automaticallyImplyLeading: false,
            title: const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Text('Mazoor Katta',textAlign: TextAlign.center, style: TextStyle(fontSize: 30 )),
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(text: 'Jobs'),
                Tab(text: 'Workers'),
                Tab(text: 'Previous'),
              ],
            ),
          ),
          drawer: emp_Sidebar(),
          body: const TabBarView(
            children: [
              jobFetch(),
              wor_View(),
              prev_jobs(),
            ],
          ),

        ),
    );
  }
}
