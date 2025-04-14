import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_case_mobile_developer/core/router/router.dart';
import 'package:test_case_mobile_developer/injections.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Case Mobile Developer.',
      routeInformationParser: AppRouter.goRouter.routeInformationParser,
      routerDelegate: AppRouter.goRouter.routerDelegate,
      routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
    );
  }
}
