import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/currencies/currencies_bloc.dart';
import '../widgets/currencies_page/currency_converter_widget.dart';
import '../widgets/currencies_page/message_display_widget.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);
  @override
  State<CurrencyConverterPage> createState() =>
      _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CurrenciesBloc>(context)
        .add(GetAllCurrenciesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(title:const Text('Currency Converter'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CurrenciesBloc, CurrenciesState>(
        builder: (context, state) {
          if (state is LoadingCurrenciesState) {
            return const LoadingWidget();
          } else if (state is LoadedCurrenciesState) {
            return  CurrencyConverterWidget(currencies: state.currencies);
          } else if (state is ErrorCurrenciesState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }




}
