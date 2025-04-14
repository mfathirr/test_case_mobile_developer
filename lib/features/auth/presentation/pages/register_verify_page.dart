import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/pages/register_mandatory_page.dart';

class RegisterVerifyPage extends StatefulWidget {
  final String email;
  static const routeName = 'register_verify_page';
  const RegisterVerifyPage({super.key, required this.email});

  @override
  State<RegisterVerifyPage> createState() => _RegisterVerifyPageState();
}

class _RegisterVerifyPageState extends State<RegisterVerifyPage> {
  final TextEditingController _verificationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.pushNamed(
            RegisterMandatoryPage.routeName,
            extra: widget.email,
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Email Verification',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 300,
              child: Text(
                'Input the verification code that has been sent to ${widget.email}',
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
                  TextFieldWidget(
                    hintText: 'Verification Code',
                    controller: _verificationCodeController,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Did not receive the code?',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: const Color(0xff6C7278),
                                ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Resend',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: const Color(0xff4D81E7),
                                ),
                      ),
                    ],
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
                            .add(AuthEvent.customerRegisterVerifyCode(
                              userId: widget.email,
                              code: _verificationCodeController.text,
                            ));
                      },
                      child: Text(
                        'Input Code',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
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
    _verificationCodeController.dispose();
  }
}
