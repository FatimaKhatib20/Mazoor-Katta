import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../variable.dart';

class worProf extends StatefulWidget {
  const worProf({Key? key}) : super(key: key);

  @override
  State<worProf> createState() => _worProfState();
}

class _worProfState extends State<worProf> {
  final genController = TextEditingController();
  final skiController = TextEditingController();
  final desController = TextEditingController();
  final qualController = TextEditingController();
  final phController = TextEditingController();
  final addressController = TextEditingController();
  late final data = uid;

  @override
  void dispose(){
    genController.dispose();
    skiController.dispose();
    qualController.dispose();
    desController.dispose();
    phController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future addwor() async{
    final db2 = FirebaseFirestore.instance.collection('worker').doc(uid);
    await db2.update({'gender': genController.text.trim(),
      'skills': skiController.text.trim(),
      'qualification': qualController.text.trim(),
      'description': desController.text.trim(),
      'phone': double.parse(phController.text.trim()),
      'address':addressController.text.trim(),
    });

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
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF16077C),
        elevation: 0.0,
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
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Gender',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: genController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'gender',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Skills',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: skiController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'skills',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Description',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: desController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'description',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Qualification',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: qualController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'qualification',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Phone Number',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: phController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'phone no',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              Container
                (
                child: const Text('Address',
                  style: TextStyle(fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: addressController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'address',
                    ),
                  )
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: addwor,
                  child: const Text
                    ('SAVE',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2),
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
