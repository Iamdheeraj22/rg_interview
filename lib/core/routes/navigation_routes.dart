import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_interview/feature/dashboard/dashboad_screen.dart';
import 'package:rg_interview/feature/login/bloc/login_bloc.dart';
import 'package:rg_interview/feature/login/login_screen.dart';
import 'package:rg_interview/feature/splash_screen/splash_screen.dart';

class NavigationRoutes {
  NavigationRoutes._internal();
  static final NavigationRoutes _instance = NavigationRoutes._internal();
  factory NavigationRoutes() => _instance;
  static String previousRoute = '';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    previousRoute = settings.name ?? '';

    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case LoginScreen.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => LoginBloc(),
            child: const LoginScreen(),
          ),
        );

      case DashboardPage.id:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
