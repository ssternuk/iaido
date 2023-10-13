import 'package:flutter/material.dart';
import 'package:iaido/ui/components/num_pad_button.dart';

class VwNumPad extends StatefulWidget {
  const VwNumPad({Key? key}) : super(key: key);

  @override
  State<VwNumPad> createState() => _NumPadButtonGridState();
}

class _NumPadButtonGridState extends State<VwNumPad> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildLastRow()
        ],
      ),
    );
  }

  Widget _buildRow(List<String> rowDigits) {
    var rowButtons = <Widget>[];
    for (var digit in rowDigits) {
      rowButtons.add(Expanded(
        child: NumPadButton(
          buttonValue: digit,
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: rowButtons),
    );
  }

  Widget _buildLastRow() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _numPadDecimal(),
            _numPadZeroButton(),
            _numPadBackspaceButton()
          ],
        ),
      );
      
  Widget _numPadDecimal() => Expanded(
          child: NumPadButton(
        buttonValue: '.',
      ));

  Widget _numPadZeroButton() => Expanded(
          child: NumPadButton(
        buttonValue: '0',
      ));

  Widget _numPadBackspaceButton() =>
      Expanded(child: NumPadButton(buttonValue: '<'));
}
