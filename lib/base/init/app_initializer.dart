import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// App initialization and setup
class AppInitializer {
  // Private constructor to prevent instantiation
  AppInitializer._();

  /// Initialize the app with necessary configurations
  static Future<void> initialize() async {
    // Ensure Flutter binding is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Set preferred orientations
    await _setPreferredOrientations();

    // Set system UI overlay style
    _setSystemUIOverlayStyle();

    // Set error handling
    _setErrorHandling();
  }

  /// Set preferred device orientations
  static Future<void> _setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// Set system UI overlay style for immersive experience
  static void _setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }

  /// Set global error handling
  static void _setErrorHandling() {
    // Handle Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint('Flutter Error: ${details.exception}');
    };

    // Handle platform errors
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        color: Colors.red,
        child: Center(
          child: Text(
            'Error: ${details.exception}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    };
  }
  /// Configure app for production
  static void configureForProduction() {
    // Production configuration can be added here
    // Debug banner is controlled in MaterialApp widget
  }
}
