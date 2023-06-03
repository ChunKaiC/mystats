import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void _onItemTapped(int index) {
    context.read<NavbarProvider>().setSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<NavbarProvider, int>(
        (navbarProvider) => navbarProvider.selectedIndex);

    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: GoogleFonts.roboto(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'Training',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_rounded),
          label: 'Calories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart),
          label: 'Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}

class NavbarProvider extends ChangeNotifier {
  int selectedIndex = 2;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
