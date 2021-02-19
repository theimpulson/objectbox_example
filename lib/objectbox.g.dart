// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'database/person.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:3592263705169907867",
        "lastPropertyId": "4:4357192030383351330",
        "name": "Person",
        "properties": [
          {"id": "1:6960664706043886782", "name": "firstName", "type": 9},
          {"id": "2:445290397279220216", "name": "lastName", "type": 9},
          {"id": "3:6510392466561058258", "name": "age", "type": 6},
          {"id": "4:4357192030383351330", "name": "id", "type": 6, "flags": 1}
        ],
        "relations": [],
        "backlinks": []
      }
    ],
    "lastEntityId": "1:3592263705169907867",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[Person] = EntityDefinition<Person>(
      model: model.getEntityByUid(3592263705169907867),
      toOneRelations: (Person object) => [],
      toManyRelations: (Person object) => {},
      getId: (Person object) => object.id,
      setId: (Person object, int id) {
        object.id = id;
      },
      objectToFB: (Person object, fb.Builder fbb) {
        final offsetfirstName =
            object.firstName == null ? null : fbb.writeString(object.firstName);
        final offsetlastName =
            object.lastName == null ? null : fbb.writeString(object.lastName);
        fbb.startTable();
        fbb.addOffset(0, offsetfirstName);
        fbb.addOffset(1, offsetlastName);
        fbb.addInt64(2, object.age);
        fbb.addInt64(3, object.id ?? 0);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Person();
        object.firstName = fb.StringReader().vTableGet(buffer, rootOffset, 4);
        object.lastName = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.age = fb.Int64Reader().vTableGet(buffer, rootOffset, 8);
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 10);
        return object;
      });

  return ModelDefinition(model, bindings);
}

class Person_ {
  static final firstName =
      QueryStringProperty(entityId: 1, propertyId: 1, obxType: 9);
  static final lastName =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final age =
      QueryIntegerProperty(entityId: 1, propertyId: 3, obxType: 6);
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 4, obxType: 6);
}
