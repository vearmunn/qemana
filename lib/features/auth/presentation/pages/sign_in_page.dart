// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qemana/core/routes/router.dart';
import 'package:qemana/features/auth/presentation/blocs/auth_state.dart';
import 'package:qemana/core/utils/spacer.dart';
import 'package:qemana/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:qemana/features/auth/presentation/pages/register_page.dart';
import 'package:qemana/features/main_menu/presentation/pages/primary_page.dart';
import 'package:qemana/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() {
    context.read<AuthCubit>().login(
          emailController.text,
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 90.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(32),
                          Image.asset('assets/images/Logo.png'),
                          Text(
                            'Sign-In',
                            style: theme.textTheme.displayLarge,
                          ),
                          verticalSpace(64),
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
                            controller: passwordController,
                            obscure: true,
                            hint: 'Your Password',
                            label: 'Password',
                          ),
                          verticalSpace(16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                                  state is! AuthLoading ? loginUser : null,
                              child: state is AuthLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text('Sign In'),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                context.push('/register');
                              },
                              child: Text(
                                "Don't have an account? Register",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
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
