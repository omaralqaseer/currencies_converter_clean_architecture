import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/currencies/currencies_bloc.dart';
import '../widgets/historical_page/historical_currency_list.dart';
import '../widgets/currencies_page/message_display_widget.dart';

class HistoricalCurrenciesPage extends StatefulWidget {
  const HistoricalCurrenciesPage({Key? key}) : super(key: key);

  @override
  State<HistoricalCurrenciesPage> createState() =>
      _HistoricalCurrenciesPageState();
}

class _HistoricalCurrenciesPageState extends State<HistoricalCurrenciesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CurrenciesBloc>(context)
        .add(GetHistoricalCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }
}

AppBar _buildAppbar() => AppBar(title: const Text('Historical Currencies'));

Widget _buildBody() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: BlocBuilder<CurrenciesBloc, CurrenciesState>(
      builder: (context, state) {
        if (state is LoadingCurrenciesState) {
          return const LoadingWidget();
        } else if (state is LoadedHistoricalCurrenciesState) {
          return HistoricalCurrencyListWidget(lstHistorical: state.historical);
        } else if (state is ErrorCurrenciesState) {
          return MessageDisplayWidget(message: state.message);
        }
        return const LoadingWidget();
      },
    ),
  );
}
