import 'package:fish_caster/bloc/token/token_bloc.dart';
import 'package:fish_caster/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart'; // Needed for kReleaseMode
import 'package:fish_caster/screen/splash_screen/splashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Disable in release mode
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TokenBloc()),
        BlocProvider(
          create: (context) => UserBloc(context.read<TokenBloc>(), context),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            locale: DevicePreview.locale(context),
            title: 'Chaser',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
