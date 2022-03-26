import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.selectedCoin,
    required this.selectedCurrency,
    required this.coinValue,
  }) : super(key: key);

  final String selectedCoin;
  final String selectedCurrency;
  final String coinValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $selectedCoin = $coinValue $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
