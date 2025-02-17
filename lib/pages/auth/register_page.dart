import 'package:flutter/material.dart';
import 'package:qemana/pages/auth/sign_in_page.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/loading_circle.dart';
import '../../utils/spacer.dart';
import '../../utils/texts.dart';
import '../../widgets/custom_textfield.dart';
import '../main_menu/primary_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController cpasswordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cpasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    super.dispose();
  }

  void registerUser() async {
    if (passwordController.text.isNotEmpty &&
        cpasswordController.text.isNotEmpty &&
        passwordController.text == cpasswordController.text) {
      loadingCircle(context);

      try {
        await supabaseClient.auth.signUp(
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
    } else {
      showSnackbar(context, 'Password tidak sama!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          height: 90.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Image.asset('assets/images/Logo.png'),
              verticalSpace(40),
              Text(
                'Sign-Up',
                style: extraLargeText(size: 100.h <= 650 ? 32 : 36),
              ),
              const Spacer(),
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
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                  child: const Text('Register'),
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignInPage()));
                    },
                    child: Text(
                      "Already have an account? Sign In",
                      style: smallText(color: mainColor),
                    )),
              ),
              const Spacer(),
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
        )),
      ),
    );
  }
}
