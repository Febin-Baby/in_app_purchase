import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pim/core/color.dart';
import 'package:pim/core/constants.dart';
import 'package:pim/screens/sign_up_screen.dart';
import 'package:pim/service/authentication.dart';
import 'package:pim/widgets/custom_button.dart';
import 'package:pim/widgets/google_buttun.dart';
import 'package:pim/widgets/last_row.dart';
import 'package:pim/widgets/text_form_field.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 400) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  khiegh20,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.width * .7,
                    child: Lottie.asset(
                      'assets/lottie/animation_lkthvyt2.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  khiegh20,
                  const Text(
                    'Welcome to i Store',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  khiegh20,
                  const Boldtext(text: 'Sign in and Continue'),
                  khieg10,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TTextFormField(
                          text: 'Enter Your Email',
                          preffix: Icons.person,
                          controller: AuthServices().loginemail,
                          inputType: TextInputType.name,
                          obscureText: false,
                        ),
                        TTextFormField(
                          text: 'Enter Your Password',
                          preffix: Icons.password_rounded,
                          controller: AuthServices().loginpassword,
                          inputType: TextInputType.name,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    txt: 'Sign In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthServices().signIn(context);
                      }
                    },
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  khieg10,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GoogleButton(),
                  ),
                  khiegh20,
                  LastRowLetters(
                    first: "Don't have an account? ",
                    second: 'Sign Up.',
                    function: () {
                      AuthServices().loginemail.clear();
                      AuthServices().loginpassword.clear();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignUpPae(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.width * .4,
          child: Lottie.asset(
            'assets/lottie/animation_lkthvyt2.json',
          ),
        );
      }
    });
  }
}
