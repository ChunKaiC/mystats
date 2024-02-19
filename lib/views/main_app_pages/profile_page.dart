import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/components/display_tile.dart';
import 'package:mystats/components/info_field.dart';
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
    final String? pfpURL = ProfileManager.getPictureURL();

    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(height: 15),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5),
                  color: Colors.blue,
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: pfpURL == null ? null : NetworkImage(pfpURL),
                child: pfpURL == null
                    ? const Icon(
                        FontAwesomeIcons.userAstronaut,
                        size: 70,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "9",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Current Streak ",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.orange)),
                            const WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.fire,
                                size: 18,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "31",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Best Streak ",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.yellow)),
                            const WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.medal,
                                size: 18,
                                color: Colors.yellow,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        DisplayTile(
          height: 140,
          label: "My Stats",
          child: const Row(
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
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              InfoField(
                label: "Name",
                controller: nameController,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              InfoField(
                label: "Sex",
                controller: sexController,
                suffixText: "Male/Female",
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              InfoField(
                label: "Height",
                controller: heightController,
                suffixText: "cms",
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              InfoField(
                label: "Weight",
                controller: weightController,
                suffixText: "kgs",
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
            ],
          ),
        ),
        DisplayTile(
            width: double.infinity,
            color: Colors.white,
            label: "Reminders",
            child: const ReminderMenu()),
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

class DayButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const DayButton({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.grey),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

class ReminderMenu extends StatefulWidget {
  const ReminderMenu({super.key});

  @override
  State<ReminderMenu> createState() => _ReminderMenuState();
}

class _ReminderMenuState extends State<ReminderMenu> {
  late TimeOfDay selectedTime;
  final List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
  late List<bool> selections;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    selections = [false, false, false, false, false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    [for (int i = 0; i < days.length; i++) i];
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < days.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selections[i] = !selections[i];
                  });
                },
                child: DayButton(label: days[i], isSelected: selections[i]),
              )
          ],
        ),
        const SizedBox(height: 15),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.blue)))),
          child: SizedBox(
            width: 150,
            child: Center(
              child: Text(
                "Remind at ${selectedTime.hour}:${selectedTime.minute}",
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ),
          ),
          onPressed: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            setState(() {
              if (time != null) {
                selectedTime = time;
              }
            });
          },
        )
      ],
    );
  }
}
