import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_case_mobile_developer/core/router/app_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddressBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Test Case Mobile Developer.',
        theme: ThemeData(
          textTheme: AppTheme.jakartaSansTextTheme,
          scaffoldBackgroundColor: Colors.white,
        ),
        routeInformationParser: AppRouter.goRouter.routeInformationParser,
        routerDelegate: AppRouter.goRouter.routerDelegate,
        routeInformationProvider: AppRouter.goRouter.routeInformationProvider,
      ),
    );
  }
}
