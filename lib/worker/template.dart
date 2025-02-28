import 'package:flutter/material.dart';


class deets extends StatefulWidget {

  @override
  _deetsState createState() => _deetsState();
}

class _deetsState extends State<deets> {
  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    "Construction",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF16077C),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              _headerStatic("Daily Wage", "Rs 1200"),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              _headerStatic("Date", "21-06-2022"),
            ],
          ),
          SizedBox(height: 40),
          Divider(
            color: const Color(0xFF202023),
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _headerStatic(String title, String sub) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF202023)
            ),
          ),
          SizedBox(height: 5),
          Text(
            sub,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF090808),
            ),
          )
        ],
      ),
    );
  }

  Widget _jobDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Clean up of building sites\n"
                "Demolish structures at work sites\n"
                "Drive building materials from warehouses to job locations\n"
                "Prepare and apply construction material to build structures",
            style: TextStyle(fontSize: 14, color: const Color(0xFF16077C)),
          ),
          Text(
            "Location",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            "'123', Lower Bhusari Colony, Paud Rd, Kothrud, Pune - 411038",
            style: TextStyle(fontSize: 14, color: const Color(0xFF16077C)),
          ),
        ],
      ),
    );
  }

  Widget _apply(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 54),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all(const Color(0xFF16077C)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 16))),
              onPressed: () {showAlertDialog(context);},
              child: Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16077C),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 1,
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              _jobDescription(context),
              _apply(context)
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Applied"),
    content: Text("You Have Successfully applied!!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}