import 'package:flutter/material.dart';

import 'currency_converter_page.dart';
import 'historical_currencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _currentTab = [
    const CurrencyConverterPage(),
    const HistoricalCurrenciesPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentTab[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Currency Converter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historical Currencies',
          )
        ],
      ),
    );
  }
}
