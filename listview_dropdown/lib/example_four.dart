// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  String selectedQualities = "Creativity";
  List<int> selectedItemArrayList = []; //Storing DropDown selected data

  List<String> qualities = [
    "Creativity",
    "Commitment",
    "Planning",
    "Optimism",
    "Innovative"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data in List from Dropdown"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
                      for (var i = 0; i < selectedItemArrayList.length; i++)
                        ListTile(
                          title: Text(selectedItemArrayList[i].toString()),
                          trailing: GestureDetector(
                            //#################### remove specific index item
                            onTap: () {
                              setState(() {
                                selectedItemArrayList
                                    .remove(selectedItemArrayList[i]);
                              });
                            },
                            child: Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  //===============================================================> Second row widget
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
                              if (selectedItemArrayList.contains(value)) {
                                //==============>>> Items Disable after selection
                                setState(() {
                                  selectedQualities = value!;
                                 //selectedItemArrayList.add(selectedQualities);
                                });
                              }
                              //===============>>> Adding item into list
                            },
                            value: selectedQualities,
                            items: qualities
                                .map(
                                  (dropdownValue) => DropdownMenuItem(
                                    child: Text(
                                      dropdownValue,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: selectedItemArrayList
                                                .contains(dropdownValue)
                                            ? Colors.grey
                                            : null,
                                      ),
                                    ),
                                    value: dropdownValue,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
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
