import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> _themeColors = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.teal,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _themeColors.length,
            'colors must be between 0 and ${_themeColors.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _themeColors[selectedColor],
    );
  }
}
