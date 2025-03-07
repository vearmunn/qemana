import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qemana/features/auth/presentation/blocs/auth_state.dart';
import 'package:qemana/core/utils/colors.dart';
import 'package:qemana/core/utils/custom_snackbar.dart';
import 'package:qemana/core/utils/spacer.dart';
import 'package:qemana/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:qemana/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController cpasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    cpasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    super.dispose();
  }

  void registerUser() {
    if (emailController.text.isEmpty) {
      showSnackbar(context, 'Please enter an email');
      return;
    }

    if (phoneController.text.isEmpty) {
      showSnackbar(context, 'Please enter a phone number');
      return;
    }

    if (passwordController.text.isEmpty || cpasswordController.text.isEmpty) {
      showSnackbar(context, 'Please enter password');
      return;
    }

    if (passwordController.text != cpasswordController.text) {
      showSnackbar(context, 'Passwords do not match!');
      return;
    }

    context.read<AuthCubit>().signUp(
          emailController.text.trim(),
          phoneController.text.trim(),
          passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go('/primary');
        } else if (state is AuthError) {
          showSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    height: 90.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/Logo.png'),
                        verticalSpace(40),
                        Text(
                          'Sign-Up',
                          style: theme.textTheme.displayLarge,
                        ),
                        Expanded(child: verticalSpace(0)),
                        CustomTextfield(
                          padding: 0,
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          hint: 'Your Email',
                          label: 'Email',
                        ),
                        verticalSpace(16),
                        CustomTextfield(
                          padding: 0,
                          controller: phoneController,
                          inputType: TextInputType.phone,
                          hint: 'Your Phone Number',
                          label: 'Phone',
                        ),
                        verticalSpace(16),
                        CustomTextfield(
                          padding: 0,
                          controller: passwordController,
                          obscure: true,
                          hint: 'Your Password',
                          label: 'Password',
                        ),
                        verticalSpace(16),
                        CustomTextfield(
                          padding: 0,
                          controller: cpasswordController,
                          obscure: true,
                          hint: 'Confirm Password',
                          label: 'Confirm Password',
                        ),
                        verticalSpace(16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                state is! AuthLoading ? registerUser : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                            ),
                            child: state is AuthLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('Register'),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              "Already have an account? Sign In",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const GreyLine(),
                            horizontalSpace(8),
                            Text(
                              'OR',
                              style: theme.textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            horizontalSpace(8),
                            const GreyLine(),
                          ],
                        ),
                        verticalSpace(16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                            ),
                            icon: Image.asset('assets/images/facebook.png'),
                            label: const Text(
                              'Continue with Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        verticalSpace(16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                            ),
                            icon: Image.asset('assets/images/google.png'),
                            label: const Text(
                              'Continue with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is AuthLoading)
                Container(
                  color: Colors.black26,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class GreyLine extends StatelessWidget {
  const GreyLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey[300],
      ),
    );
  }
}
