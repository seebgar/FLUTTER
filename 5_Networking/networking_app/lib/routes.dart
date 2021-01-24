import 'package:flutter/material.dart';
import 'package:networking_app/routes/_index/index.dart';
import 'package:networking_app/routes/_index/sidebar.dart';
import 'package:networking_app/routes/categorias/categorias.dart';
import 'package:networking_app/routes/sistemas/sistemas.dart';
import 'package:networking_app/widgets/login/login-page.dart';

/// Route management class
class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute<Index>(
          builder: (_) => const Index(),
        );
      case "/sistemas":
        return MaterialPageRoute<Sistemas>(
          builder: (_) => const Sistemas(),
        );
      case "/categorias":
        return MaterialPageRoute<Categorias>(
          builder: (_) => const Categorias(),
        );
      case "/login":
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
        );
      case "/menu":
        return MaterialPageRoute<SideBarMenu>(
          builder: (_) => SideBarMenu(),
        );
      default:
        throw RouteException("Route not found");
    }
  }

  static const homePage = '/';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
