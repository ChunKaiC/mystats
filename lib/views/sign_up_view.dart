import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/managers/profile_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.light
      ..dismissOnTap = true;

    final buttonSize = MediaQuery.of(context).size.width * .7;
    final padding = (MediaQuery.of(context).size.width - buttonSize) / 2 + 5;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * .2,
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
          child: Column(children: [
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: .50,
            )),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
              child: Text(
                'Create\nAccount',
                textAlign: TextAlign.justify,
                style: GoogleFonts.koulen(
                    fontSize: 65, color: Colors.white, height: 1),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: .1,
            )),
            SignUpForm(),
          ]),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController(text: '');
  final passwordController1 = TextEditingController(text: '');
  final passwordController2 = TextEditingController(text: '');
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
                cursorColor: Colors.white,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !EmailValidator.validate(value)) {
                    return 'Invalid email';
                  }
                  return null;
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: hintStyle,
                    errorStyle: erroStyle),
              ),
            ),
            SizedBox(
              height: 55,
              child: TextFormField(
                style: textStyle,
                cursorColor: Colors.white,
                controller: passwordController1,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid password';
                  } else if (value.length < 6) {
                    return 'Must be at least 6 characters';
                  }
                  return null;
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: hintStyle,
                    errorStyle: erroStyle),
              ),
            ),
            SizedBox(
              height: 55,
              child: TextFormField(
                style: textStyle,
                cursorColor: Colors.white,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Repeat password';
                  } else if (value != passwordController1.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                controller: passwordController2,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: 'Repeat password',
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
                    EasyLoading.show(status: 'Creating Account...');
                    final cred =
                        await ProfileManager.signUpWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController1.text);
                    if (cred != null) {
                      EasyLoading.dismiss();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main_app_view', (route) => false);
                    } else {
                      EasyLoading.dismiss();
                      EasyLoading.showError('Email registered. Try loging in!');
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
                    Icon(Icons.done_all),
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
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.white,
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
                      'Create with Google',
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
