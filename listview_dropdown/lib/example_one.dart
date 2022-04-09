// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  String selectedQualities = "Creativity";
  List<String> selectedItem_ArrayList = []; //Storing DropDown selected data

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
      appBar: AppBar(title: Text("Hola")),
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
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < selectedItem_ArrayList.length; i++)
                          ListTile(
                            title: Text(selectedItem_ArrayList[i]),
                            trailing: GestureDetector(
                              //#################### remove specific index item
                              onTap: () {
                                setState(() {
                                  selectedItem_ArrayList
                                      .remove(selectedItem_ArrayList[i]);
                                  print(selectedItem_ArrayList);
                                });
                              },
                              child: const Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  //=====================================>>> Second row widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select new skills"),
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
                        margin: const EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            underline: Container(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                selectedQualities = value!;
                                selectedItem_ArrayList.add(selectedQualities);
                              }); //==============================>>> Adding item into list
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
