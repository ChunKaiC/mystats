import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/managers/profile_manager.dart';
import 'dart:ui' as ui;

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.light
      ..dismissOnTap = true;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900]!,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Container(
          clipBehavior: Clip.none,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900]!,
                Colors.blue[900]!,
                Colors.blue[700]!,
                Colors.blue[500]!,
                Colors.blue[200]!,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(children: const [
            Flexible(
                child: FractionallySizedBox(
              heightFactor: .50,
            )),
            Logo(),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: .35,
            )),
            SignInForm(),
          ]),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  final textStyle = GoogleFonts.roboto(color: Colors.white, fontSize: 16);
  final hintStyle = GoogleFonts.roboto(color: Colors.white70, fontSize: 16);
  final erroStyle = GoogleFonts.roboto(color: Colors.red, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: FractionallySizedBox(
        widthFactor: .7,
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: TextFormField(
                style: textStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  }
                },
                cursorColor: Colors.white,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Email:',
                    hintStyle: hintStyle,
                    errorStyle: erroStyle),
              ),
            ),
            SizedBox(
              height: 55,
              child: TextFormField(
                style: textStyle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  }
                },
                cursorColor: Colors.white,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: 'Password:',
                    hintStyle: hintStyle,
                    errorStyle: erroStyle),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    EasyLoading.show(status: 'Signing in...');
                    final cred =
                        await ProfileManager.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    EasyLoading.dismiss();
                    if (cred == null) {
                      EasyLoading.showError(
                          'Incorrect credentials, try again!');
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'main_app_view', (route) => false);
                    }
                  }
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.rightFromBracket),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sign in',
                      style: GoogleFonts.roboto(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint('Forgot password ');
              },
              child: Container(
                // color: Colors.red,
                alignment: Alignment.center,
                width: 150,
                height: 35,
                child: Text(
                  'Forgot password',
                  style: GoogleFonts.roboto(color: Colors.white70),
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.white.withOpacity(.5),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  EasyLoading.show(status: 'Signing in with google');
                  final cred = await ProfileManager.signInWithGoogle();
                  EasyLoading.dismiss();
                  if (cred != null) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main_app_view', (route) => false);
                  }
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.google),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sign in with Google',
                      style: GoogleFonts.roboto(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.white.withOpacity(.5),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up_view');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Create Account',
                      style: GoogleFonts.roboto(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.ssid_chart_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              TextSpan(
                text: 'mystats',
                style: GoogleFonts.koulen(
                    height: .1, fontSize: 70, color: Colors.white),
              ),
            ],
          ),
        ),
        Text(
          'visualize your fitness progress',
          style: GoogleFonts.roboto(color: Colors.white60),
        ),
      ],
    );
  }
}
