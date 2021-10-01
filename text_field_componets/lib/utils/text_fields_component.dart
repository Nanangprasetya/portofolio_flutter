import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_field_componets/utils/currency_input_formatter.dart';

class TextFieldCurrencyNumber extends StatelessWidget {
  final List<TextInputFormatter> inputFormatters;

  const TextFieldCurrencyNumber({Key key, this.inputFormatters}) : super(key: key,);

  List<TextInputFormatter> get list => [
    CurrencyInputFormatter(),
    WhitelistingTextInputFormatter.digitsOnly
  ];
  
  
  List<TextInputFormatter> formatters(){
    var data = [];
      data.add(CurrencyInputFormatter());
      data.add(WhitelistingTextInputFormatter.digitsOnly);
      return data;
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatters.map((e) => e),
    );
  }
}