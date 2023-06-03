import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/components/navbar.dart';
import 'package:provider/provider.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    // Sync navbar index with page controller
    final navbarProvider = context.read<NavbarProvider>();
    navbarProvider.addListener(syncNavbarWithPages);

    // Set initial page
    pageController = PageController(initialPage: navbarProvider.selectedIndex);
  }

  void syncNavbarWithPages() {
    setState(() {
      final navbarProvider = context.read<NavbarProvider>();
      pageController.jumpToPage(
        navbarProvider.selectedIndex,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      body: Container(
        color: Colors.blue[900]!,
        child: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              Container(
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
                child: Center(
                    child: Text(
                  'Training Page',
                  style: GoogleFonts.roboto(color: Colors.white),
                )),
              ),
              Container(
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
                child: Center(
                    child: Text(
                  'Calories Page',
                  style: GoogleFonts.roboto(color: Colors.white),
                )),
              ),
              Container(
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
                child: Center(
                    child: Text(
                  'Summary Page',
                  style: GoogleFonts.roboto(color: Colors.white),
                )),
              ),
              Container(
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
                child: Center(
                    child: Text(
                  'Leaderboard Page',
                  style: GoogleFonts.roboto(color: Colors.white),
                )),
              ),
              Container(
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
                child: Center(
                    child: Text(
                  'Profile Page',
                  style: GoogleFonts.roboto(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
