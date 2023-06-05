import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystats/components/navbar.dart';
import 'package:mystats/views/main_app_pages/calories_page.dart';
import 'package:mystats/views/main_app_pages/profile_page.dart';
import 'package:mystats/views/main_app_pages/ranking_page.dart';
import 'package:mystats/views/main_app_pages/summary_page.dart';
import 'package:mystats/views/main_app_pages/training_page.dart';
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
            children: [
              TrainingPage(),
              CaloriesPage(),
              SummaryPage(),
              RankingPage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
