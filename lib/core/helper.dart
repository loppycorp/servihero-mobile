import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;

  return text[0].toUpperCase() + text.substring(1);
}

String formatCurrency(double value) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US', // Use the appropriate locale
    symbol: r'$', // Specify the currency symbol
    decimalDigits: 2, // Number of decimal digits
  );

  return currencyFormat.format(value);
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final regExp = RegExp(r'^[0-9]+([0-9]?)?$');
    if (regExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}

class DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final regExp = RegExp(r'^[0-9]+([.][0-9]{2,})?$');
    if (regExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}

String formatDisplayNameToEmail(String text) {
  final regex =
      RegExp('[^a-zA-Z0-9_]'); // Matches special characters except underscore
  final formattedText = text
      .toLowerCase() // Convert to lowercase first
      .replaceAll(regex, '')
      .replaceAll(' ', '_');
  return '$formattedText@wa.com';
}

bool isValidNumber(String? input) {
  if (input == null || input.isEmpty) {
    return false;
  }
  // Use try-catch to handle potential errors when parsing
  try {
    double.parse(input); // Use double.parse for decimal numbers
    return true;
  } catch (e) {
    return false;
  }
}

int countOccurrences<T>(List<T> list, T item) {
  return list.where((element) => list.contains(item)).length;
}
