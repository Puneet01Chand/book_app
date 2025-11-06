import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // Push a named route onto the stack
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  // Push a route onto the stack
  void push(Route<dynamic> route) {
    Navigator.push(this, route);
  }

  // Replace the current route with a named route
  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  // Replace the current route with a new route
  void pushReplacement(Route<dynamic> newRoute, {Route<dynamic>? oldRoute}) {
    Navigator.pushReplacement(this, newRoute, result: oldRoute);
  }

  // Push a named route and remove previous routes until predicate is satisfied
  void pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  // Push a new route and remove previous routes until predicate is satisfied
  void pushAndRemoveUntil(
    Route<dynamic> newRoute,
    bool Function(Route<dynamic>) predicate,
  ) {
    Navigator.pushAndRemoveUntil(this, newRoute, predicate);
  }

  // Pop the current route off the stack
  void pop([Object? result]) {
    Navigator.pop(this, result);
  }

  // Pop the current route with a named route
  void popAndPushNamed(String routeName, {Object? arguments}) {
    Navigator.popAndPushNamed(this, routeName, arguments: arguments);
  }

  // Pop all routes and push a named route
  void popUntilAndPushNamed(
    String routeName, {
    Object? arguments,
    required bool Function(Route<dynamic>) predicate,
  }) {
    Navigator.popUntil(this, predicate);
    pushNamed(routeName, arguments: arguments);
  }

  // Pop all routes until the predicate returns true
  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.popUntil(this, predicate);
  }

  // Check if there is a previous route in the stack
  bool canPop() {
    return Navigator.canPop(this);
  }

  // Maybe pop the current route off the stack
  Future<bool> maybePop([Object? result]) {
    return Navigator.maybePop(this, result);
  }

  // Get Arguments
  T? getArguments<T>() {
    return ModalRoute.of(this)?.settings.arguments as T?;
  }
}
