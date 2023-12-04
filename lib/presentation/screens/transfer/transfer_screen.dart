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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransferProvider>(
          lazy: false,
          create: (_) => TransferProvider(),
        ),
      ],
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
  _TransferBodyState createState() => _TransferBodyState();
}

class _TransferBodyState extends State<TransferBody> {

  late int idAccountReceiver;
  late int amount;

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
                amount = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              
              final id = await transferProvider.createTransfer(
                idAccountSender: widget.idAccountSender,
                idAccountReceiver: idAccountReceiver,
                amount: amount,
              );
              print(id);
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Transferencia'),
          ),
        ],
      ),
    );
  }
}