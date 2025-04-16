import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_case_mobile_developer/core/router/app_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_local.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initInjections();

  final authLocal = getIt<AuthLocal>();
  final String? token = await authLocal.getToken();
  final bool isLoggedIn = token != null;

  final AppRouter appRouter = AppRouter(isLoggedIn: isLoggedIn);

  runApp(MyApp(
    appRouter: appRouter,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;

  const MyApp({super.key, this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<AddressBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Test Case Mobile Developer.',
        theme: ThemeData(
          textTheme: AppTheme.jakartaSansTextTheme,
          scaffoldBackgroundColor: Colors.white,
        ),
        routeInformationParser: appRouter?.goRouter.routeInformationParser,
        routerDelegate: appRouter?.goRouter.routerDelegate,
        routeInformationProvider: appRouter?.goRouter.routeInformationProvider,
      ),
    );
  }
}
