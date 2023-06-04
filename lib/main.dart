import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mystats/components/navbar.dart';
import 'package:mystats/views/main_app_view.dart';
import 'package:mystats/views/landing_view.dart';
import 'package:mystats/views/sign_up_view.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // initializes firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final user = FirebaseAuth.instance.currentUser;
    final initialRoute = user == null ? '/landing_view' : '/main_app_view';

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavbarProvider())],
      child: MaterialApp(
        builder: EasyLoading.init(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        initialRoute: '/landing_view',
        routes: {
          '/landing_view': (context) => const LandingView(),
          '/sign_up_view': (context) => const SignUpView(),
          '/main_app_view': (context) => const MainAppView(),
        },
      ),
    );
  }
}
