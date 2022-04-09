// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:listview_dropdown/provider/storage_provider.dart';
import 'package:provider/provider.dart';

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  //
  //
  String selectedQualities = "Resilience";
  List<String> skillsAndQualities = [
    "Resilience",
    "Creativity",
    "Self-reliability",
    "Patience",
    "Courage",
    "Commitment",
    "Willpower",
    "Passion",
    "Planning",
    "Integrity",
    "Optimism",
    "Risk Taking",
    "Self confidence",
    "Empathy",
    "Flexibility",
    "Innovative",
    "Persistence",
    "Pro-active"
  ];

  //
  String selecDevelopSkills = "Resilience";
  List<String> needToDevelopQualities = [
    "Resilience",
    "Creativity",
    "Self-reliability",
    "Patience",
    "Courage",
    "Commitment",
    "Willpower",
    "Passion",
    "Planning",
    "Integrity",
    "Optimism",
    "Risk Taking",
    "Self confidence",
    "Empathy",
    "Flexibility",
    "Innovative",
    "Persistence",
    "Pro-active"
  ];

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    //
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Text("what_qualities_have_to_support"),
              SizedBox(height: 10),

              //
              Row(
                children: [
                  Flexible(
                    child: storeValues.skillsQualities.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: storeValues.skillsQualities.length,
                            itemBuilder: (BuildContext context, index) {
                              return ListTile(
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                dense: true,
                                minVerticalPadding: 0,
                                minLeadingWidth: 10,
                                horizontalTitleGap: 0,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 0.0),
                                leading: Text(
                                  '• ',
                                ),
                                title: Text(skillsAndQualities[
                                    storeValues.skillsQualities[index]]),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      storeValues.skillsQualities.remove(
                                          storeValues.skillsQualities[index]);
                                      print("===> deleted");
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              );
                            })
                        : Text("no skill selected"),
                  ),
                  //
                  Flexible(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Select new skills"),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFE10202),
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
                                    print(value);
                                    /* 
                                    * add this index in storage 
                                    */
                                    storeValues.addSkillsQualities(
                                        skillsAndQualities.indexOf(value));
                                    print(skillsAndQualities.indexOf(value));
                                  });
                                },
                                value: selectedQualities,
                                items: skillsAndQualities
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
              ),
              SizedBox(height: 20),
              //

              //

              Text("Skills need to develop"),
              Row(
                children: [
                  Flexible(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: storeValues.developskillsQualities.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          dense: true,
                          minVerticalPadding: 0,
                          minLeadingWidth: 10,
                          horizontalTitleGap: 0,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          leading: Text(
                            '• ',
                          ),
                          title: Text(needToDevelopQualities[
                              storeValues.developskillsQualities[index]]),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                storeValues.developskillsQualities.remove(
                                    storeValues.developskillsQualities[index]);
                                print("===> deleted");
                              });
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                  //
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select new skills"),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
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
                                  selecDevelopSkills = value!;
                                  print(value);
                                  /* 
                                    * add this index in storage 
                                    */
                                  storeValues.addDevelopaddSkillsQualities(
                                      needToDevelopQualities.indexOf(value));
                                  print(needToDevelopQualities.indexOf(value));
                                });
                              },
                              value: selecDevelopSkills,
                              items: needToDevelopQualities
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
