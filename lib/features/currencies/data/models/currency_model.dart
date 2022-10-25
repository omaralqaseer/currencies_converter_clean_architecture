import '../../domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({int? id, required String name, required String code})
      : super(id: id, name: name, code: code);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json[CurrencyFields.id],
      name: json[CurrencyFields.name] ?? '',
      code: json[CurrencyFields.code] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CurrencyFields.id: id,
      CurrencyFields.name: name,
      CurrencyFields.code: code,
    };
  }
}

const String tableCurrency = 'currency';

class CurrencyFields {
  static final List<String> values = [
    /// Add all fields
    id, name, code
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String code = 'code';
}
