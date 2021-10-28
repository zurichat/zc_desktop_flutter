import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('de'),
    const Locale('ar'),
    const Locale('es'),
  ];

  static Locale getTranslation(String language) {
    switch (language) {
      case 'UAE (Arabic)':
        return Locale('ar');
      case 'Deutschland (Deutsch)':
        return Locale('de');
      case 'United Kingdon (English)':
        return Locale('en');
      case 'Latinoamerica (Espanol)':
        return Locale('es');
      case 'United States (English)':
        return Locale('en');
      case 'India (English)':
        return Locale('en');
      default:
        return Locale('en');
    }
  }
}
