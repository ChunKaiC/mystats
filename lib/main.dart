import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:mystats/components/navbar.dart';
import 'package:mystats/views/home_view.dart';
import 'package:mystats/views/landing_view.dart';
import 'package:mystats/views/login_view.dart';
import 'package:mystats/views/sign_up_view.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  // initializes firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavbarProvider())],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        initialRoute: '/landing_view',
        routes: {
          '/landing_view': (context) => const LandingView(),
          '/login_view': (context) => const LoginView(),
          '/sign_up_view': (context) => const SignUpView(),
          '/home_view': (context) => HomeView(),
        },
      ),
    );
  }
}
