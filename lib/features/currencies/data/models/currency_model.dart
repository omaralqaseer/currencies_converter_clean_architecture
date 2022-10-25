import '../../domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({String? id, required String currencyName, required String currencySymbol})
      : super(id: id, currencyName: currencyName, currencySymbol: currencySymbol);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json[CurrencyFields.id],
      currencyName: json[CurrencyFields.currencyName] ?? '',
      currencySymbol: json[CurrencyFields.currencySymbol] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CurrencyFields.id: id,
      CurrencyFields.currencyName: currencyName,
      CurrencyFields.currencySymbol: currencySymbol,
    };
  }
}

const String tableCurrency = 'currency';

class CurrencyFields {
  static final List<String> values = [
    /// Add all fields
    primaryID,id, currencyName, currencySymbol
  ];

  static const String primaryID = '_id';
  static const String id = 'id';
  static const String currencyName = 'currencyName';
  static const String currencySymbol = 'currencySymbol';
}
