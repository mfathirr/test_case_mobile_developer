import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/address/presentation/pages/address_page.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.pushNamed(AddressPage.routeName),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Sign in to your Account',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 300,
              child: Text(
                'Enter your email and password to log in',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(0xff6C7278),
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffEFF0F6), width: 2),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: Color(0xffEFF0F6),
                          width: 2,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign up with Google',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xff1A1C1E),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        color: Color(0xffEDF1F3),
                        thickness: 3,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Or',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: const Color(0xff6C7278),
                                  ),
                        ),
                      ),
                      const Expanded(
                          child: Divider(
                        color: Color(0xffEDF1F3),
                        thickness: 3,
                      )),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    hintText: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    obscureText: true,
                    hintText: 'Password',
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xff1D61E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthEvent.customerLogin(
                              userId: _emailController.text,
                              password: _passwordController.text,
                            ));
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: const Color(0xff6C7278),
                                ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => context.pushNamed(RegisterPage.routeName),
                        child: Text(
                          'Sign Up',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: const Color(0xff4D81E7),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
