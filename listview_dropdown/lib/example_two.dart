// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  String selectedQualities = "Creativity";
  List<String> qualities = [
    "Creativity",
    "Commitment",
    "Planning",
    "Optimism",
    "Innovative"
  ];

  var myQuality_1 = "";
  var myQuality_2 = "";
  var myQuality_3 = "";
  var myQuality_4 = "";
  var myQuality_5 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExampleTwo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What qualities do I have to support me in achieving my goal.",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (myQuality_1.isNotEmpty)
                        ListTile(
                          title: Text(myQuality_1),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                myQuality_1 = "";
                              });
                            },
                            child: const Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),

                      //=====================================================2
                      if (myQuality_2.isNotEmpty)
                        ListTile(
                          title: Text(myQuality_2),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                myQuality_2 = "";
                              });
                            },
                            child:
                                Icon(Icons.delete_rounded, color: Colors.red),
                          ),
                        ),
                      //=====================================================3

                      if (myQuality_3.isNotEmpty)
                        ListTile(
                          title: Text(myQuality_3),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                myQuality_3 = "";
                              });
                            },
                            child:
                                Icon(Icons.delete_rounded, color: Colors.red),
                          ),
                        ),

                      //=====================================================4

                      if (myQuality_4.isNotEmpty)
                        ListTile(
                          title: Text(myQuality_4),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                myQuality_4 = "";
                              });
                            },
                            child:
                                Icon(Icons.delete_rounded, color: Colors.red),
                          ),
                        ),

                      //=====================================================5

                      if (myQuality_5.isNotEmpty)
                        ListTile(
                          title: Text(myQuality_5),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                myQuality_5 = "";
                              });
                            },
                            child:
                                Icon(Icons.delete_rounded, color: Colors.red),
                          ),
                        )
                    ],
                  ),
                ),
                Expanded(
                  //===============================================================> Second row widget
                  child: Container(
                    //color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select new skills"),
                        Container(
                          // width: 163,
                          height: 40,
                          decoration: BoxDecoration(
                            //color: Colors.green,
                            border: Border.all(
                              color: Color(0xff8E8E8E),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          margin: EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  selectedQualities = value!;

                                  if (myQuality_1.isEmpty) {
                                    myQuality_1 = selectedQualities;
                                  } else if (myQuality_1.isNotEmpty &&
                                      myQuality_2.isEmpty) {
                                    myQuality_2 = selectedQualities;
                                  } else if (myQuality_2.isNotEmpty &&
                                      myQuality_3.isEmpty) {
                                    myQuality_3 = selectedQualities;
                                  } else if (myQuality_3.isNotEmpty &&
                                      myQuality_4.isEmpty) {
                                    myQuality_4 = selectedQualities;
                                  } else if (myQuality_4.isNotEmpty &&
                                      myQuality_5.isEmpty) {
                                    myQuality_5 = selectedQualities;
                                  }
                                });
                              },
                              value: selectedQualities,
                              items: qualities
                                  .map((state) => DropdownMenuItem(
                                        child: Text(
                                          state,
                                          maxLines: 2,
                                        ),
                                        value: state,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
