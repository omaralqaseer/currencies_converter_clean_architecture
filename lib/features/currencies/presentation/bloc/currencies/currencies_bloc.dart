import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/currency.dart';
import '../../../domain/entities/historical.dart';
import '../../../domain/usecases/get_all_currencies.dart';
import '../../../domain/usecases/get_historical_currencies.dart';

part 'currencies_event.dart';

part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetAllCurrenciesUseCase getAllCurrencies;
  final GetHistoricalCurrenciesUseCase getHistoricalCurrencies;

  CurrenciesBloc({
    required this.getAllCurrencies,
    required this.getHistoricalCurrencies,
  }) : super(CurrenciesInitial()) {
    on<CurrenciesEvent>((event, emit) async {
      if (event is GetAllCurrenciesEvent) {
        emit(LoadingCurrenciesState());

        final failureOrCurrencies = await getAllCurrencies();
        emit(_mapFailureOrCurrenciesToState(failureOrCurrencies));
      } else if (event is GetHistoricalCurrenciesEvent) {
        emit(LoadingCurrenciesState());

        final failureOrHistoricalCurrencies = await getHistoricalCurrencies();
        emit(_mapFailureOrHistoricalCurrenciesToState(
            failureOrHistoricalCurrencies));
      }
    });
  }

  CurrenciesState _mapFailureOrCurrenciesToState(
      Either<Failure, List<Currency>> either) {
    return either.fold(
      (failure) => ErrorCurrenciesState(message: _mapFailureToMessage(failure)),
      (currencies) => LoadedCurrenciesState(
        currencies: currencies,
      ),
    );
  }

  CurrenciesState _mapFailureOrHistoricalCurrenciesToState(
      Either<Failure, List<Historical>> either) {
    return either.fold(
      (failure) => ErrorCurrenciesState(message: _mapFailureToMessage(failure)),
      (historical) => LoadedHistoricalCurrenciesState(
        historical: historical.reversed.toList(),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      // case OfflineFailure:
      //   return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
