import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String? id;
  final String currencyName;
  final String currencySymbol;

  const Currency({
    this.id,
    required this.currencyName,
    required this.currencySymbol,
  });

  @override
  List<Object?> get props => [id, currencyName, currencySymbol];
}
