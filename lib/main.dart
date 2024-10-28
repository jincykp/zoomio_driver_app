import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomio_driverapp/firebase_options.dart';
import 'package:zoomio_driverapp/views/bloc/profile/bloc/profile_bloc.dart'; // Import your ThemeCubit
import 'package:zoomio_driverapp/views/bloc/themestate/thememode.dart';
import 'package:zoomio_driverapp/views/splash_screen.dart';

void main() async {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(), // Create ThemeCubit
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(), // Light theme
            darkTheme: ThemeData.dark(), // Dark theme
            themeMode: themeMode == ThemeModeState.dark
                ? ThemeMode.light
                : ThemeMode.dark, // Set theme mode based on state
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
