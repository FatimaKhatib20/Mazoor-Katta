import 'package:edi_final/worker/doneJobs.dart';
import 'package:edi_final/worker/sidebar.dart';
import 'package:edi_final/worker/viewJobsW.dart';
import 'package:flutter/material.dart';


class work_home extends StatefulWidget {
  const work_home({Key? key}) : super(key: key);

  @override
  State<work_home> createState() => _work_homeState();
}

class _work_homeState extends State<work_home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              Tab(text: 'History'),
            ],
          ),
        ),
        drawer: sideBar(),
        body: const TabBarView(
          children: [
            viewJ(),
            doneJ(),
          ],
        ),

      ),
    );
  }
}
