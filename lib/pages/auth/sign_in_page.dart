// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qemana/pages/auth/register_page.dart';
import 'package:qemana/pages/main_menu/primary_page.dart';

import 'package:qemana/utils/colors.dart';
import 'package:qemana/utils/spacer.dart';
import 'package:qemana/utils/texts.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../../utils/loading_circle.dart';
import '../../widgets/custom_textfield.dart';

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

  void loginUser() async {
    loadingCircle(context);

    try {
      await supabaseClient.auth.signInWithPassword(
          password: passwordController.text, email: emailController.text);

      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const PrimaryPage()));
    } on AuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent, content: Text(e.message)));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 90.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  Expanded(child: verticalSpace(0)),
                  Text(
                    100.h <= 650 ? 'Account Login' : 'Account\nLogin',
                    style: extraLargeText(size: 100.h <= 650 ? 32 : 36),
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
                    controller: passwordController,
                    obscure: true,
                    hint: 'Your Password',
                    label: 'Password',
                  ),
                  verticalSpace(16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loginUser,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: customBlack),
                      child: const Text('Sign In'),
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterPage()));
                        },
                        child: Text(
                          "Don't have an account? Register",
                          style: smallText(color: mainColor),
                        )),
                  ),
                  Expanded(child: verticalSpace(0)),
                  Row(
                    children: [
                      const GreyLine(),
                      horizontalSpace(8),
                      Text(
                        'OR',
                        style: extraSmallText(
                            color: customBlack, weight: FontWeight.bold),
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
                          backgroundColor: Colors.grey[300]),
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
                          backgroundColor: Colors.grey[300]),
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

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contoh Aplikasi Flutter'),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.group,
//               size: 50,
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Selamat datang di Flutter!',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
