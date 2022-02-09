import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DemoLocalizations {
  static Future<DemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty == true
        ? locale.languageCode
        : locale.toString();
    final String localName = Intl.canonicalizedLocale(name);
    return initializeM
  }
}
