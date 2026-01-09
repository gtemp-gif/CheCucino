import 'package:che_cucino/app/routes/app_router.dart';
import 'package:che_cucino/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CheCucinoApp extends StatelessWidget {
  const CheCucinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'CheCucino',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
