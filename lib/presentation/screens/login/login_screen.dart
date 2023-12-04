import 'package:bank_mobile/presentation/screens/bank_account/bank_account_screen.dart';
import 'package:bank_mobile/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              TextButton(onPressed: () {}, child: const Text('Registrarse...')),
              ElevatedButton(
                onPressed: () async {
                  final username = await loginProvider.getUser(email, password);

                  if (username != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BankAccountScreen(user: username),
                      ),
                    );
                  } else {

                  }
                },
                child: const Text('Iniciar sesión'),
              ),
            ],
          ),
        );
      },
    );
  }
}
