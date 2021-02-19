import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:objectbox_example/database/person.dart';
import 'package:objectbox_example/database/store_helpers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('INSERT'),
                onPressed: () async {
                  var person =
                      Person(firstName: "Aayush", lastName: "Gupta", age: 22);
                  int id = await StoreHelpers.insert(person);
                  log("Sucessfully inserted an object with $id");
                },
              ),
              RaisedButton(
                child: Text('UPDATE'),
                onPressed: () async {
                  var person = await StoreHelpers.queryPerson(1);
                  person.firstName = 'Nidhun';
                  person.lastName = 'Balaji';
                  person.age = 22;
                  int id = await StoreHelpers.insert(person);
                  log("Sucessfully updated an object with $id");
                },
              ),
              RaisedButton(
                child: Text('DELETE'),
                onPressed: () async {
                  bool deleted = await StoreHelpers.delete(1);
                  if (deleted) {
                    log("Sucessfully deleted an object with id :1");
                  }
                },
              ),
              RaisedButton(
                child: Text('QUERY ALL'),
                onPressed: () async {
                  var list = await StoreHelpers.queryAllPersons();
                  log(list.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
