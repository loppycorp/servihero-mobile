import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herohub_app/0_data/hive/auth_login_hive_model.dart';
import 'package:herohub_app/core/routes.dart';
import 'package:hive_flutter/adapters.dart';
import 'injection.dart' as di;
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(AuthLoginHiveAdapter());

  await Hive.initFlutter();

  await Hive.openBox<AuthLoginHive>('authLogin');
  await di.init();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardTheme: const CardTheme(color: Colors.white),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        colorScheme: lightColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Hero Hub',
      routerConfig: routes,
    );
  }
}

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white,
);

ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal, // Change this to your desired primary color
  brightness: Brightness.dark,
);

ThemeData myTheme = ThemeData(
  colorScheme: lightColorScheme,
  brightness: Brightness.light,
);
