import 'package:currencyconverter_clean_arch/features/currencies/presentation/pages/historical_currencies.dart';

import '/features/currencies/presentation/pages/currencies_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _currentTab = [
    const CurrenciesPage(),
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
            label: 'Currencies',
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
