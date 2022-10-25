import '/features/currencies/data/models/currency_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'db_types.dart';

class CurrenciesDatabaseHelper {
  ///Singleton Design Pattern
  static final CurrenciesDatabaseHelper instance =
      CurrenciesDatabaseHelper._init();

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
//  // ${UserInfoFields.timestamp} $integerType
    await db.execute('''
CREATE TABLE $tableCurrency (
  ${CurrencyFields.primaryID} $idType,
  ${CurrencyFields.id} $textType,
  ${CurrencyFields.currencyName} $textType,
  ${CurrencyFields.currencySymbol} $textType
  )
''');
  }

  Future<void> createCurrency(Map<String,dynamic> jsonCurrency) async {


      final db = await instance.database;
      await db.insert(tableCurrency, jsonCurrency,
          conflictAlgorithm: ConflictAlgorithm.replace).then((value) {

      });
  }

  Future<List<Map<String, Object?>>> readCurrenciesJson() async {
      final db = await instance.database;
      final result = await db.query(
        tableCurrency,
        columns: CurrencyFields.values,
      );
      return result;
    }


Future close() async {
  final db = await instance.database;
  db.close();
}
}
