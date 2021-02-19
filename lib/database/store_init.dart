import 'dart:io';

import 'package:objectbox_example/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class BoxStore {
  static Future<Store> getStore() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
  }
}
