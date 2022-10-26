import 'package:flutter/material.dart';

import '../../../domain/entities/historical.dart';

class HistoricalCurrencyListWidget extends StatelessWidget {
  final List<Historical> lstHistorical;

  const HistoricalCurrencyListWidget({
    Key? key,
    required this.lstHistorical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: lstHistorical.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
              '${lstHistorical[index].fromCurrency} - ${lstHistorical[index].toCurrency}'),
          title: Text(
            lstHistorical[index].value.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            lstHistorical[index].date,
            style: const TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
