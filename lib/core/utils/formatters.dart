import 'package:flutter/services.dart';

class Formatters {
  static final TextInputFormatter digitsOnly =
      FilteringTextInputFormatter.digitsOnly;

  static TextInputFormatter maxLength(int maxLength) {
    return LengthLimitingTextInputFormatter(maxLength);
  }

  static final TextInputFormatter alphanumericOnly =
      FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9]'),
  );

  static TextInputFormatter decimalWithPrecision(int decimalPlaces) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text;
      final regex = RegExp(r'^\d*\.?\d{0,' + decimalPlaces.toString() + r'}$');
      return regex.hasMatch(text) ? newValue : oldValue;
    });
  }

  static TextInputFormatter capitalizeWords() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text;
      final formattedText = text.replaceAllMapped(
        RegExp(r'\b\w'),
        (match) => match.group(0)!.toUpperCase(),
      );
      return newValue.copyWith(
        text: formattedText,
        selection: newValue.selection,
      );
    });
  }

  static final TextInputFormatter phoneNumber =
      TextInputFormatter.withFunction((oldValue, newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 6) {
        buffer.write('-');
      }
      buffer.write(text[i]);
    }
    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  });
}
