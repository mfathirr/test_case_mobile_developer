import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/features/address/domain/entities/customer_list_address_blueray_entity.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray_param.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/addres_create_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/addres_update_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_map_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_multiple_create_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_page.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_search_data_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/login_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_mandatory_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_verify_page.dart';

class AppRouter {
  final bool isLoggedIn;

  AppRouter({required this.isLoggedIn});

  late final GoRouter goRouter = GoRouter(
    initialLocation:
        isLoggedIn ? '/${AddressPage.routeName}' : '/${LoginPage.routeName}',
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
      GoRoute(
        path: '/${AddressPage.routeName}',
        name: AddressPage.routeName,
        builder: (context, state) => const AddressPage(),
      ),
      GoRoute(
        path: '/${AddresCreatePage.routeName}',
        name: AddresCreatePage.routeName,
        builder: (context, state) => const AddresCreatePage(),
      ),
      GoRoute(
        path: '/${AddressMapPage.routeName}',
        name: AddressMapPage.routeName,
        builder: (context, state) => AddressMapPage(
          point: state.extra as GeoPoint?,
        ),
      ),
      GoRoute(
        path: '/${AddressSearchDataPage.routeName}',
        name: AddressSearchDataPage.routeName,
        builder: (context, state) => const AddressSearchDataPage(),
      ),
      GoRoute(
        path: '/${AddresUpdatePage.routeName}',
        name: AddresUpdatePage.routeName,
        builder: (context, state) => AddresUpdatePage(
          data: state.extra as CustomerAddressEntity,
        ),
      ),
      GoRoute(
        path: '/${AddressMultipleCreatePage.routeName}',
        name: AddressMultipleCreatePage.routeName,
        builder: (context, state) => AddressMultipleCreatePage(
          data: state.extra as CustomerCreateBluerayParam?,
        ),
      ),
    ],
  );
}
