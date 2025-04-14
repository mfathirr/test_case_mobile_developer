import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_case_mobile_developer/core/widget/text_field_widget.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';

class RegisterMandatoryPage extends StatefulWidget {
  final String email;
  static const routeName = 'register_mandatory_page';
  const RegisterMandatoryPage({super.key, required this.email});

  @override
  State<RegisterMandatoryPage> createState() => _RegisterMandatoryPageState();
}

class _RegisterMandatoryPageState extends State<RegisterMandatoryPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'Fill in the data',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 300,
            child: Text(
              'Fill in the data to complete the registration process',
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
                  hintText: 'Email',
                  readOnly: true,
                  controller: _emailController,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        hintText: 'First Name',
                        controller: _firstNameController,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFieldWidget(
                        hintText: 'Last Name',
                        controller: _lastNameController,
                      ),
                    ),
                  ],
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
                      context.read<AuthBloc>().add(
                            AuthEvent.customerRegisterMandatory(
                              userId: widget.email,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Did not receive the code?',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: const Color(0xff6C7278),
                    ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () => context
                    .read<AuthBloc>()
                    .add(AuthEvent.customerRegisterResendCode(
                      userId: widget.email,
                    )),
                child: Text(
                  'Resend',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color(0xff4D81E7),
                      ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
