import 'package:flutter/material.dart';



class Example extends StatefulWidget{
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  List<String> listitems = ["United States of America", "Canada", "United Kingdom", "China", "Russia", "Austria"];
  String selectval = "United States of America";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title:const Text("Dropdown Button in Flutter"),
              backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            children: [
              Container( 
                  margin: EdgeInsets.only(top:80),
                  alignment: Alignment.topCenter,
                  child: DropdownButton(
                      value: selectval,
                      onChanged: (value){
                         setState(() {
                            selectval = value.toString();
                         });
                      },
                      items: listitems.map((itemone){
                          return DropdownMenuItem(
                            value: itemone,
                            child: Text(itemone)
                          );
                      }).toList(),
                  ),
              ),
            ],
          )
      );
  }
}