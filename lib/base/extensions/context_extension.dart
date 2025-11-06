import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

extension ContextExtension on BuildContext {
  // Theme and Text Styles
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  /// Returns true if the current theme is dark mode
  bool get isDark => theme.brightness == Brightness.dark;

  TextStyle? get displayLarge =>
      textTheme.displayLarge?.copyWith(color: colors.onSurface);
  TextStyle? get displayMedium =>
      textTheme.displayMedium?.copyWith(color: colors.onSurface);
  TextStyle? get displaySmall =>
      textTheme.displaySmall?.copyWith(color: colors.onSurface);
  TextStyle? get headlineLarge =>
      textTheme.headlineLarge?.copyWith(color: colors.onSurface);
  TextStyle? get headlineMedium =>
      textTheme.headlineMedium?.copyWith(color: colors.onSurface);
  TextStyle? get headlineSmall =>
      textTheme.headlineSmall?.copyWith(color: colors.onSurface);
  TextStyle? get titleLarge =>
      textTheme.titleLarge?.copyWith(color: colors.onSurface);
  TextStyle? get titleMedium =>
      textTheme.titleMedium?.copyWith(color: colors.onSurface);
  TextStyle? get titleSmall =>
      textTheme.titleSmall?.copyWith(color: colors.onSurface);
  TextStyle? get labelLarge =>
      textTheme.labelLarge?.copyWith(color: colors.onSurface);
  TextStyle? get labelMedium =>
      textTheme.labelMedium?.copyWith(color: colors.onSurface);
  TextStyle? get labelSmall =>
      textTheme.labelSmall?.copyWith(color: colors.onSurface);
  TextStyle? get bodyLarge =>
      textTheme.bodyLarge?.copyWith(color: colors.onSurface);
  TextStyle? get bodyMedium =>
      textTheme.bodyMedium?.copyWith(color: colors.onSurface);
  TextStyle? get bodySmall =>
      textTheme.bodySmall?.copyWith(color: colors.onSurface);

  // Screen Dimensions
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  bool get isMobile => width < 500;
  bool get isTablet => width >= 500 && width < 1100;
  bool get isDesktop => width >= 1100;

  // Orientation and Device Info
  Orientation get orientation => MediaQuery.of(this).orientation;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  // Safe area and Insets
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // Platform checks
  bool get isWeb => kIsWeb;
  bool get isAndroid => theme.platform == TargetPlatform.android;
  bool get isIos => theme.platform == TargetPlatform.iOS;
}


