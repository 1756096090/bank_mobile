import 'package:bank_mobile/presentation/providers/transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatelessWidget {
  final int user;
  final int idAccountSender;

  const TransferScreen({
    Key? key,
    required this.user,
    required this.idAccountSender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransferProvider>(
      create: (_) => TransferProvider(),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transferencia'),
        ),
        body: TransferBody(user: user, idAccountSender: idAccountSender),
      ),
    );
  }
}

class TransferBody extends StatefulWidget {
  final int user;
  final int idAccountSender;

  const TransferBody({
    Key? key,
    required this.user,
    required this.idAccountSender,
  }) : super(key: key);

  @override
  _TransferBodyState createState() =>
      _TransferBodyState(user: user, idAccountSender: idAccountSender);
}

class _TransferBodyState extends State<TransferBody> {
  final int user;
  final int idAccountSender;
  late int idAccountReceiver;
  late double amount;

  _TransferBodyState({required this.user, required this.idAccountSender});

  @override
  Widget build(BuildContext context) {
    final transferProvider = context.watch<TransferProvider>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Cuenta de destino',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                idAccountReceiver = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Cantidad',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                amount = double.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              final response = await transferProvider.createTransfer(
                context: context,
                idAccountSender: widget.idAccountSender,
                idAccountReceiver: idAccountReceiver,
                amount: amount,
              );
              Navigator.of(context).pop();
              
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Transferencia'),
          ),
        ],
      ),
    );
  }
}
