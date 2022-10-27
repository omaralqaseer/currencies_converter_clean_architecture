import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/network/end_points.dart';
import '../../../domain/entities/currency.dart';

class CurrenciesWidget extends StatelessWidget {
  final List<Currency> currencyLst;
  final String currencyConvertLabel;

  const CurrenciesWidget({
    Key? key,
    required this.currencyLst,
    required this.currencyConvertLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              currencyConvertLabel,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  hint: _buildCurrencyWidget(currencyLst.first),
                  items: getDropDownListItem(),
                  // value:,
                  onChanged: (value) {
                    //
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownListItem() {
    return currencyLst!
        .map((currency) => DropdownMenuItem<String>(
              value: currency.id,
      child: _buildCurrencyWidget(currency),
            ))
        .toList();
  }

  _buildCurrencyWidget(Currency currency) {
  return  SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Image.network(
              '${EndPoints.FLAGS_BASE_URL}/${currency.id!.substring(0, 2).toLowerCase()}.png',
              errorBuilder: (ctx, _, __) {
                return SvgPicture.asset('assets/flags/xx.svg');
              },
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              currency.currencyName!,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
