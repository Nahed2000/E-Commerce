import 'dart:io';

import 'package:ecommerce/constance.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController db = DbController._();

  DbController._();

  late Database _database;

  Database get database => _database;

  initDatabase() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE $tableCartProduct(
        $columnName TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL)
        ''');
    });
  }

  Future<List<CartProductModel>>getAllProduct()async{
    var dbClint = database;
    List <Map<String,dynamic>>map = await dbClint.query(tableCartProduct);
    List<CartProductModel> list= map.isNotEmpty
        ?map.map((product) => CartProductModel.fromJson(product)).toList()
        :[];
    return list ;
  }

  insert({required CartProductModel model}) async {
    var dbClint = database;
    await dbClint.insert(tableCartProduct, model.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

// static final DbController _instance = DbController._();
//
// factory DbController() {
//   return _instance;
// }
//
// DbController._();
//
// late Database _database;
//
// Database get database => _database;
//
// Future<void> initDatabase() async {
//   print('init data base');
//   Directory directory = await getApplicationDocumentsDirectory();
//   String path = join(directory.path, 'db.sql');
//   print('we are here');
//   _database = await openDatabase(path, version: 1,
//       onCreate: (Database db, int version) {
//     print('in open  database ');
//     db.execute('CREATE TABLE USER ('
//         'id INTEGER PRIMARY KEY AUTOINCREMENT,'
//         'quantity INTEGER,'
//         'name TEXT,'
//         'price TEXT,'
//         'image TEXT,'
//         ')');
//     print('in table in database database 02 ');
//   });
//   print('success create database');
// }
}
