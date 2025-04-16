import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_verify_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register_page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.pushNamed(
            RegisterVerifyPage.routeName,
            extra: _emailController.text,
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
              ),
              const SizedBox(width: 10),
              const Text('Sing Up'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Create an account BlueRay Cargo',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(0xff6C7278),
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
                    TextFieldWidget(
                      hintText: 'Email',
                      controller: _emailController,
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
                          context
                              .read<AuthBloc>()
                              .add(AuthEvent.customerRegisterMini(
                                userId: _emailController.text,
                              ));
                        },
                        child: Text(
                          'Register',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
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
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
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
                              color: Color(0xffEFF0F6), width: 2),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Sign up with Google',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xff1A1C1E),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }
}
