import '../../domain/entities/historical.dart';

class HistoricalModel extends Historical {
  const HistoricalModel({
    required String fromCurrency,
    required String toCurrency,
    required String date,
    required double value,
  }) : super(
            fromCurrency: fromCurrency,
            toCurrency: toCurrency,
            date: date,
            value: value);
}
