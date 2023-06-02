import 'package:flutter/material.dart';

class Pokemon {
  const Pokemon(
    this.name,
    this.icon,
  );

  getName() {
    return this.name.toUpperCase();
  }

  getIcon() {
    return this.icon;
  }

  final String name;
  final IconData icon;
}
