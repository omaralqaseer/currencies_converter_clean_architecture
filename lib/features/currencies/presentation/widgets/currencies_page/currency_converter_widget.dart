import 'package:flutter/material.dart';
import '../../../domain/entities/currency.dart';
import 'currencies_widget.dart';

class CurrencyConverterWidget extends StatelessWidget {
  final List<Currency> currencies;

  const CurrencyConverterWidget({
    Key? key,
    required this.currencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CurrenciesWidget(
              currencyLst: currencies,
              currencyConvertLabel: 'From',
            ),
            const SizedBox(height: 12.0),
            CurrenciesWidget(
              currencyLst: currencies,
              currencyConvertLabel: 'To',
            ),
            const SizedBox(height: 32.0),
            Container(
              color: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const TextField(
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Amount',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 40.0,
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: const Text('Convert')),
            ),
            Container(
                width: double.maxFinite,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                margin: const EdgeInsets.only(top: 48.0),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Result :',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 8.0),
                    //value
                    const Text(''),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
