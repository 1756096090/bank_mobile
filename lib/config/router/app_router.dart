import 'package:bank_mobile/presentation/View/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: LoginScreen.name,
    builder: (context, state) => LoginScreen(),
  ),
  
]);
