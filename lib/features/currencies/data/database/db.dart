import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CurrenciesDatabaseHelper {
  ///Singleton Design Pattern
  static final CurrenciesDatabaseHelper instance = CurrenciesDatabaseHelper._init();

  static Database? _currenciesDatabase;

  CurrenciesDatabaseHelper._init();

  Future<Database> get database async {
    if (_currenciesDatabase != null) return _currenciesDatabase!;
    _currenciesDatabase = await _initDB('currencies_app.db');
    return _currenciesDatabase!;
  }

  Future<Database> _initDB(String filePath) async {
    //default android and ios path
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {

// if you have another table add here  like below ..
//     await db.execute('''
// CREATE TABLE $tableUserInfo (
//   ${UserInfoFields.id} $idType,
//   ${UserInfoFields.token} $textType,
//   ${UserInfoFields.firstName} $textType,
//   ${UserInfoFields.timestamp} $integerType,
//   ${UserInfoFields.name} $textType,
//   ${UserInfoFields.email} $textType,
//   ${UserInfoFields.username} $textType,
//   ${UserInfoFields.deviceType} $textType,
//   ${UserInfoFields.lastName} $textType
//   )
// ''');
//
  }




  // Future<ConstantModel> createConstantInfo(ConstantModel constantModel) async {
  //   final db = await instance.database;
  //   final id = await db.insert(tableConstant, constantModel.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   return constantModel.copy(id: id);
  // }
  //
  // Future<ConstantModel> readConstant(int id) async {
  //   final db = await instance.database;
  //   final maps = await db.query(
  //     tableConstant,
  //     columns: ConstantFields.values,
  //     where: '${ConstantFields.id} = ?',
  //     whereArgs: [id],
  //   );
  //   if (maps.isNotEmpty) {
  //     return ConstantModel.fromLocalJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }


  // Future close() async {
  //   final db = await instance.database;
  //   db.close();
  // }
}