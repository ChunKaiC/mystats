import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/managers/profile_manager.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController emailController =
      TextEditingController(text: ProfileManager.getEmail());
  final TextEditingController nameController =
      TextEditingController(text: ProfileManager.getName());
  final TextEditingController sexController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    FontAwesomeIcons.userAstronaut,
                    size: 70,
                  ),
                ),
              ),
            ),
          ),
        ),
        const DisplayTile(
          height: 150,
          label: "My Stats",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatDisplay(label: "Squat", value: 315),
              StatDisplay(label: "Bench", value: 225),
              StatDisplay(label: "Deadlift", value: 405)
            ],
          ),
        ),
        DisplayTile(
          color: Colors.white,
          label: "Personal Information",
          child: Column(
            children: [
              InfoField(
                label: "Email Address",
                controller: emailController,
                readOnly: true,
              ),
              InfoField(
                label: "Name",
                controller: nameController,
              ),
              InfoField(
                  label: "Sex",
                  controller: sexController,
                  suffixText: "Male/Female"),
              InfoField(
                  label: "Height",
                  controller: heightController,
                  suffixText: "cms"),
              InfoField(
                  label: "Weight",
                  controller: weightController,
                  suffixText: "kgs"),
            ],
          ),
        ),
        const DisplayTile(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          label: "Reminders",
          child: Text("Notifications"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pushNamedAndRemoveUntil(
                context, '/landing_view', (route) => false);
            await ProfileManager.signOut();
          },
          child: const Text(
            'Sign out',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class StatDisplay extends StatelessWidget {
  final String label;
  final int value;

  const StatDisplay({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                "$value",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoField extends StatelessWidget {
  final String label;
  final String? suffixText;
  final TextEditingController? controller;
  final bool? readOnly;

  const InfoField({
    super.key,
    required this.label,
    this.suffixText,
    this.controller,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
                readOnly: readOnly ?? false,
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  suffixText: suffixText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DisplayTile extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String label;
  final Widget child;

  const DisplayTile(
      {super.key,
      this.height,
      this.width,
      this.color,
      required this.label,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 15),
            Container(
              width: width ?? double.infinity,
              height: height,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: color ?? Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: child),
            ),
          ],
        ),
        IntrinsicWidth(
          stepWidth: 25,
          child: Container(
            height: 30,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              label,
              style: GoogleFonts.roboto(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
