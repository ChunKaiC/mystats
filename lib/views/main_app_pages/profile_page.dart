import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/managers/profile_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Profile Page',
            style: GoogleFonts.roboto(color: Colors.white),
          ),
          TextButton(
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/landing_view', (route) => false);
                await ProfileManager.signOut();
              },
              child: Text('Sign out'))
        ],
      ),
    );
  }
}
