import 'package:bank_mobile/infrastructure/models/transfer_model.dart';
import 'package:bank_mobile/presentation/providers/list_transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTransferScreen extends StatelessWidget {
  final int idAccount;
  const ListTransferScreen({Key? key, required this.idAccount});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListTransferProvider>(
          lazy: false,
          create: (_) => ListTransferProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de transferencias'),
        ),
        body: ListTransferBody(
          idAccount: idAccount,
        ),
      ),
    );
  }
}

class ListTransferBody extends StatelessWidget {
  final int idAccount;

  const ListTransferBody({
    Key? key,
    required this.idAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    final listTransferProvider = context.watch<ListTransferProvider>();
    final transferencias = ListTransferProvider().getListTransfer(idAccount);
    final List<TransferModel> listTransfer = listTransferProvider.transferencias;

    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: listTransfer.length,
      itemBuilder: (context, index) {
        final transferencia = listTransfer[index];
        return ListTile(
          title: Text('Transferencia ${transferencia.idTransfer}'),
          subtitle: Text('Monto: ${transferencia.amount.toString()}'),
          // ... otros detalles de la transferencia
        );
      },
    );
  }
}
