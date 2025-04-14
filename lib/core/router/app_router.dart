import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/login_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_mandatory_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_verify_page.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/${LoginPage.routeName}',
    routes: [
      GoRoute(
        path: '/${LoginPage.routeName}',
        name: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/${RegisterPage.routeName}',
        name: RegisterPage.routeName,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/${RegisterVerifyPage.routeName}',
        name: RegisterVerifyPage.routeName,
        builder: (context, state) => RegisterVerifyPage(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        path: '/${RegisterMandatoryPage.routeName}',
        name: RegisterMandatoryPage.routeName,
        builder: (context, state) => RegisterMandatoryPage(
          email: state.extra as String,
        ),
      ),
    ],
  );
}
