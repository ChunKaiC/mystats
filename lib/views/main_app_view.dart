import 'package:flutter/material.dart';
import 'package:mystats/components/navbar.dart';
import 'package:mystats/views/main_app_pages/journal_page.dart';
import 'package:mystats/views/main_app_pages/profile_page.dart';
import 'package:mystats/views/main_app_pages/ranking_page.dart';
import 'package:mystats/views/main_app_pages/summary_page.dart';
import 'package:mystats/views/main_app_pages/chat_page.dart';
import 'package:provider/provider.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  late final PageController pageController;
  late final NavbarProvider navbarProvider;

  @override
  void initState() {
    super.initState();

    // Sync navbar index with page controller
    navbarProvider = context.read<NavbarProvider>();
    navbarProvider.addListener(syncNavbarWithPages);

    // Set initial page
    pageController = PageController(initialPage: navbarProvider.selectedIndex);
  }

  @override
  void dispose() {
    // Desync
    navbarProvider.removeListener(syncNavbarWithPages);
    super.dispose();
  }

  void syncNavbarWithPages() {
    setState(
      () {
        final navbarProvider = context.read<NavbarProvider>();
        pageController.jumpToPage(
          navbarProvider.selectedIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Navbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[900]!,
              Colors.blue[900]!,
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[700]!,
              Colors.blue[500]!,
              Colors.blue[200]!,
              Colors.blue[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              JournalPage(),
              ChatPage(),
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
