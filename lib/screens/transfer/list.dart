import 'package:curso_flutter/models/transferencia.dart';
import 'package:curso_flutter/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  TransferList({Key? key}) : super(key: key);

  final List<Transfer?> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return StateTransferList();
  }
}

class StateTransferList extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(Transfer(
            transfer!.accountNumber.toDouble(),
            transfer.value.toInt(),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return const TransferForm();
          }))).then((value) {
            _reload(value);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _reload(Transfer? value) {
    if (value != null) {
      setState(() {
        widget._transfers.add(value);
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  // ignore: use_key_in_widget_constructors
  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.accountNumber.toString()),
    ));
  }
}
