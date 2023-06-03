import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 200),
                const Logo(),
                const SizedBox(height: 100),
                Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Login');
                      Navigator.pushNamed(context, '/login_view');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                    child: const Text('Login'),
                  ),
                ),
                Container(
                  width: 250,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('Sign Up');
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    debugPrint('Skip');
                  },
                  child: Container(
                      width: 120,
                      height: 30,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: const Center(child: Text('Set up later'))),
                ),
              ],
            ),
          ),
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
                  size: 55,
                ),
              ),
              TextSpan(
                text: 'mystats',
                style: GoogleFonts.koulen(
                    height: .1, fontSize: 65, color: Colors.white),
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
