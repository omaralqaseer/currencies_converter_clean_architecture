import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';


class CurrencyListWidget extends StatelessWidget {
  final List<Currency> currencies;
  const CurrencyListWidget({
    Key? key,
    required this.currencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(currencies[index].id.toString()),
          title: Text(
            currencies[index].name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            currencies[index].code,
            style: const TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
