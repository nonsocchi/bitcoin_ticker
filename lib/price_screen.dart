import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'coin_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency = 'AUD';
  Map<String, String> coinPrices = {};
  bool isWaiting = false;

  DropdownButton<String> getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedCurrency,
      elevation: 16,
      onChanged: (String? value) {
        setState(() {
          _selectedCurrency = value!;
          getData();
        });
      },
      items: dropdownItems,
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(_selectedCurrency);
      isWaiting = false;
      setState(() {
        coinPrices = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (String coin in cryptoList)
                  CoinCard(
                    selectedCoin: coin,
                    selectedCurrency: _selectedCurrency,
                    coinValue: isWaiting ? '...' : coinPrices[coin] as String,
                  ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropDownItems(),
          ),
        ],
      ),
    );
  }
}
