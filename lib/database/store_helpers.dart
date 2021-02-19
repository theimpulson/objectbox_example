import 'package:objectbox_example/database/person.dart';
import 'package:objectbox_example/database/store_init.dart';

class StoreHelpers {
  /// Contains various static methods to help with the database
  /// management.

  static Future<int> insert(Person person) async {
    /// Inserts the given [person] object into the box
    var store = await BoxStore.getStore();
    var box = store.box<Person>();
    return box.put(person);
  }

  static Future<bool> delete(int id) async {
    /// Removes a person object from the box using the given [id]
    var store = await BoxStore.getStore();
    var box = store.box<Person>();
    return box.remove(id);
  }

  static Future<List<Map<dynamic, dynamic>>> queryAllPersons() async {
    /// Returns a list of all person objects stored in the box
    var store = await BoxStore.getStore();
    var box = store.box<Person>();

    var listToReturn = <Map<dynamic, dynamic>>[];
    var listOfPersons = box.getAll();

    for (Person person in listOfPersons) {
      var map = {};
      map['firstName'] = person.firstName;
      map['lastName'] = person.lastName;
      map['age'] = person.age;
      map['id'] = person.id;
      listToReturn.add(map);
    }
    return listToReturn;
  }

  static Future<Person> queryPerson(int id) async {
    /// Returns a person stored in the box using the given [id]
    var store = await BoxStore.getStore();
    var box = store.box<Person>();
    return box.get(id);
  }
}
