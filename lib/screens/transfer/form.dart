import 'package:curso_flutter/models/transferencia.dart';
import 'package:flutter/material.dart';

import '../../components/editor.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateTransferForm();
  }
}

class StateTransferForm extends State<TransferForm> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerAccountNumber,
              label: 'Número da conta',
              tip: '0000',
              iconData: Icons.account_balance,
            ),
            Editor(
              controller: _controllerValue,
              label: 'Valor',
              tip: '0.00',
              iconData: Icons.attach_money,
            ),
            ElevatedButton(
              onPressed: () {
                _createTransfer(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double? value = double.tryParse(_controllerValue.text);
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      Navigator.pop(
        context,
        createdTransfer,
      );
    }
  }
}
