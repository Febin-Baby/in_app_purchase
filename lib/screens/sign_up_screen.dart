import 'package:flutter/material.dart';
import 'package:pim/core/color.dart';
import 'package:pim/screens/sign_in_screen.dart';
import 'package:pim/service/authentication.dart';
import 'package:pim/widgets/custom_button.dart';
import 'package:pim/widgets/last_row.dart';
import 'package:pim/widgets/text_form_field.dart';

// ignore: must_be_immutable
class SignUpPae extends StatelessWidget {
  SignUpPae({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              khiegh20,
              khiegh20,
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.width * .7,
                child: Image.asset(
                  'assets/images/Unknown.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Welcome to E-Bucket',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              khieg10,
              const Text(
                'Sign Up And Continue',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TTextFormField(
                        text: 'Enter Your name',
                        preffix: Icons.person,
                        controller: AuthServices().name,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter Your email',
                        preffix: Icons.email_outlined,
                        controller: AuthServices().email,
                        inputType: TextInputType.name,
                        obscureText: false,
                      ),
                      TTextFormField(
                        text: 'Enter Your password',
                        preffix: Icons.password_sharp,
                        controller: AuthServices().password,
                        inputType: TextInputType.name,
                        obscureText: true,
                      ),
                    ],
                  )),
              CustomButton(
                txt: 'Sign Up',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthServices().signuUp();
                  }
                },
              ),
              LastRowLetters(
                first: "Already have an account? ",
                second: 'Sign In.',
                function: () {
                  AuthServices().password.clear();
                  AuthServices().name.clear();
                  AuthServices().email.clear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
