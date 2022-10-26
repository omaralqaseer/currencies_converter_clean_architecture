part of 'currencies_bloc.dart';



abstract class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

class CurrenciesInitial extends CurrenciesState {}

class LoadingCurrenciesState extends CurrenciesState {}

class LoadedCurrenciesState extends CurrenciesState {
  final List<Currency> currencies;

  const LoadedCurrenciesState({required this.currencies});

  @override
  List<Object> get props => [currencies];
}

class LoadedHistoricalCurrenciesState extends CurrenciesState {
  final List<Historical> historical;

  const LoadedHistoricalCurrenciesState({required this.historical});

  @override
  List<Object> get props => [historical];
}

class ErrorCurrenciesState extends CurrenciesState {
  final String message;

  const ErrorCurrenciesState({required this.message});

  @override
  List<Object> get props => [message];
}
