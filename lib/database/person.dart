import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  String firstName;
  String lastName;
  int age;
  int id;

  Person({this.firstName, this.lastName, this.age});
}
