import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Hero", [
      SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true)
    ]));
    database.createTable(SchemaTable("_User", [
      SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("mobile", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("role_id", ManagedPropertyType.integer, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("enabled", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn(
          "create_time", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn(
          "modify_time", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("creator", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("modifier", ManagedPropertyType.string, isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final heroNames = ["Mr. Nice", "Narco", "Bombasto", "Celeritas", "Magneta"];

    for (final heroName in heroNames) {
      await database.store.execute(
          "INSERT INTO _Hero (name) VALUES (@name)", substitutionValues: {
        "name": heroName
      });
    }


    final users = [
      [
        "Mr. Nice",
        "1",
        1000,
        2010 - 1 - 1,
        2010 - 2 - 2,
        "wangyu",
        "1",
        "13577776666"
      ],
      [
        "Narco",
        "1",
        1000,
        2010 - 1 - 1,
        2010 - 2 - 2,
        "wangyu",
        "1",
        "13477776666"
      ],
      [
        "Bombasto",
        "1",
        1000,
        2010 - 1 - 1,
        2010 - 2 - 2,
        "wangyu",
        "1",
        "13377776666"
      ],
      [
        "Celeritas",
        "1",
        1000,
        2010 - 1 - 1,
        2010 - 2 - 2,
        "wangyu",
        "1",
        "13277776666"
      ],
      [
        "Magneta",
        "1",
        1000,
        2010 - 1 - 1,
        2010 - 2 - 2,
        "wangyu",
        "1",
        "13177776666"
      ]
    ];

    for (final heroName in users) {
      await database.store.execute(
          "INSERT INTO _User (name,role_id,enabled,create_time,modify_time,creator,modifier,mobile) VALUES (@name,@role_id,@enabled,@create_time,@modify_time,@creator,@modifier,@mobile)",
          substitutionValues: {
            "name": heroName[0],
            "role_id": heroName[1],
            "mobile": heroName[7],
            "enabled": heroName[2],
            "create_time": heroName[3],
            "modify_time": heroName[4],
            "creator": heroName[5],
            "modifier": heroName[6],

          });
    }
  }
}