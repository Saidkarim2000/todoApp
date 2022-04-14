import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final todo = <String>[];
  String input = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Qaydnoma',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.yellow[600],
      ),
      bottomNavigationBar: SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          TextField(
            onChanged: (String value) {
              input = value;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                suffixIcon: Material(
                  elevation: 5.0,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black
                    ),
                    icon: Icon(Icons.add, color: Colors.white,),
                    label: Text(''),
                    onPressed: (){
                      setState(() {
                        todo.add(input);
                      });
                    },
                  ),
                )
            ),
          ),
        ],),
      ),

      body: ListView.builder(itemCount: todo.length, itemBuilder: (BuildContext context, index) {
        return Dismissible(
            key: Key(todo[index]),
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(todo[index]),
                trailing: IconButton(
                  icon: Icon(
                    Icons.check_box,
                    size: 40,
                    color: Colors.green[200],
                  ),
                  onPressed: () {
                    setState(() {
                      todo.removeAt(index);
                    });
                  },
                ),
              ),
            ));
      }),
    );
  }
}


