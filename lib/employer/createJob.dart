import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../variable.dart';

class create_Jobs extends StatefulWidget {
  const create_Jobs({Key? key}) : super(key: key);

  @override
  State<create_Jobs> createState() => _create_JobsState();
}

class _create_JobsState extends State<create_Jobs> {

  final titleController = TextEditingController();
  final durController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descriController = TextEditingController();
  final reqController = TextEditingController();
  final addressController = TextEditingController();
  final payController = TextEditingController();
  late final data1;
  get doc_id1 => uid;

  @override
  void dispose(){
    titleController.dispose();
    dateController.dispose();
    durController.dispose();
    timeController.dispose();
    reqController.dispose();
    addressController.dispose();
    payController.dispose();
    super.dispose();
  }


  Future createJob () async{

    data1 = { 'title': titleController.text.trim(),
      'date': dateController.text.trim(),
      'time': timeController.text.trim(),
      'duration': durController.text.trim(),
      'pay': payController.text.trim(),
      'location': addressController.text.trim(),
      'req': reqController.text.trim(),
      'active': true,
    };
    
    final db4 = FirebaseFirestore.instance.collection('employer').doc('7IwF0z0OoZmSXyMr4mqS').collection('jobs').doc('job4');
    db4.set(data1);

    final db5 = FirebaseFirestore.instance.collection('jobs_data');
    db5.add({
      'title': titleController.text.trim(),
      'desc': descriController.text.trim(),
    });

    payController.clear();
    addressController.clear();
    reqController.clear();
    descriController.clear();
    timeController.clear();
    dateController.clear();
    durController.clear();
    titleController.clear();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar
        (
        leading: IconButton
          (
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create New Job'),
        backgroundColor: const Color(0xFF16077C),
        elevation: 5,
      ),
      body: SingleChildScrollView
        (
        child: Padding
          (
          padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20),
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Title',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField
                (
                controller: titleController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'title',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Duration (in Days)',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField
                (
                controller: durController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'duration (in days)',
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date',
                    style: TextStyle(fontSize: 20.0,),
                  ),
                  const SizedBox(height: 10.0),
                  TextField
                    (
                    controller: dateController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'date',
                    ),
                  ),
                  const Text('Time',
                    style: TextStyle(fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                      TextField
                        (
                        controller: timeController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration
                          (
                          border: OutlineInputBorder(),
                          labelText: 'time',
                        ),
                      )
                ],
              ),

              const SizedBox(height: 20.0),
              const Text('Pay (per day)',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField
                (
                controller: payController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'pay',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Requirements',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField
                (
                controller: reqController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'requirements',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Address',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField
                (
                controller: addressController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'address',
                ),
              ),
              const SizedBox(height: 30.0),
              Center
                (
                child: MaterialButton
                  (
                  minWidth: double.infinity,
                  height: 70,
                  color: const Color(0xFF16077C),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: createJob,
                  child: const Text
                    ('SAVE',
                    style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
