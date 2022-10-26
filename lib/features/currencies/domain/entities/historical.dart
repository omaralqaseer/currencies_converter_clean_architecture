import 'package:equatable/equatable.dart';

class Historical extends Equatable {
  final String fromCurrency;
  final String toCurrency;
  final String date;
  final double value;

  const Historical({
    required this.fromCurrency,
    required this.toCurrency,
    required this.date,
    required this.value,
  });

  @override
  List<Object?> get props => [fromCurrency, toCurrency, date, value];
}
