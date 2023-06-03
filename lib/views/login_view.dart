import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = (MediaQuery.of(context).size.width - 250) / 2 + 10;

    return Scaffold(
      body: Container(
        color: Colors.blue[900]!,
        child: SafeArea(
          bottom: false,
          child: Container(
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
            child: Column(
              children: [
                const SizedBox(height: 175),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
                      child: Text(
                        'Welcome\nBack',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.koulen(
                            fontSize: 65, color: Colors.white, height: 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Google login');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home_view', (route) => false);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                    child: const Text('Google Login'),
                  ),
                ),
                Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Apple Login');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                    child: const Text('Apple Login'),
                  ),
                ),
                Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Email Login');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                    child: const Text('Email Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
