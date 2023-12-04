import 'package:bank_mobile/presentation/providers/bank_account_provider.dart';
import 'package:bank_mobile/presentation/screens/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccountScreen extends StatelessWidget {
  static const String name = 'bank_account_screen';
  final int user;

  const BankAccountScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BankAccountProvider>(
          lazy: false,
          create: (_) {
            final bankAccountProvider = BankAccountProvider(user: user);
            return bankAccountProvider;
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bank Account Details'),
        ),
        body: BankAccountDetailsWidget(
          user: user,
        ),
      ),
    );
  }
}

class BankAccountDetailsWidget extends StatelessWidget {
  final int user;

  const BankAccountDetailsWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final bankAccountProvider = context.watch<BankAccountProvider>();
    final bankAccount = bankAccountProvider.bankAccount;

    if (bankAccount != null) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Numero de Cuenta bancaria: ${bankAccount.idAccount}'),
            Text('Numero del usuario: ${bankAccount.idUser}'),
            Text('Tipo de cuenta: ${bankAccount.accountNumber}'),
            Text('Cantidad: ${bankAccount.accountAmount}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.list_alt_outlined),
                  label: const Text('Lista de Transferencias'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransferScreen(
                            user: user, idAccountSender: bankAccount.idAccount),
                      ),
                    );
                  },
                  icon: const Icon(Icons.currency_exchange),
                  label: const Text('Transferir'),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
