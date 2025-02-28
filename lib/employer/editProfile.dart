import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';

import '../variable.dart';

class edit_Prof extends StatefulWidget {
  const edit_Prof({Key? key}) : super(key: key);

  @override
  State<edit_Prof> createState() => _edit_ProfState();
}

class _edit_ProfState extends State<edit_Prof> {

  final user =FirebaseAuth.instance.currentUser!;
  final descController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  get doc_id => uid;

  @override
  void dispose(){
    descController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future addDets() async {
    final db1 = FirebaseFirestore.instance.collection('employer').doc('7IwF0z0OoZmSXyMr4mqS');
    await db1.update({'description': descController.text.trim() ,
      'phone': double.parse(phoneController.text.trim()),
      'address': locationController.text.trim()});
    descController.clear();
    phoneController.clear();
    locationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF16077C),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20),
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              const SizedBox(height: 20.0),
              const Text('Description',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: descController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'description',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              const Text('Phone Number',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: phoneController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'phone no',
                    ),
                  )
              ),
              const SizedBox(height: 20.0),
              const Text('Address',
                style: TextStyle(fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Center
                (
                  child: TextField
                    (
                    controller: locationController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration
                      (
                      border: OutlineInputBorder(),
                      labelText: 'address',
                    ),
                  )
              ),
              const SizedBox(height: 30.0),
              Center
                (
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 70,
                  color: const Color(0xFF16077C),
                  textColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: addDets,
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
