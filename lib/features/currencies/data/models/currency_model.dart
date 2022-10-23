
import '../../domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
