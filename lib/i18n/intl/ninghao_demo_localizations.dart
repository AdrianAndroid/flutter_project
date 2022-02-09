import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../localizations_const.dart';
import 'ninghao_demo_messages_all.dart';

// 宁皓网教程
// flutter pub pub run intl_translation:extract_to_arb
// --output-dir=lib/demo/i18n/intl/
// lib/demo/i18n/intl/ninghao_demo_localizations.dart
// 自己摸索
// flutter pub run intl_generator:extract_to_arb --output-dir=lib/i18n/intl/ lib/i18n/intl/ninghao_demo_localizations.dart
class NinghaoDemoLocalizations {

  static NinghaoDemoLocalizations? of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
        context,
        NinghaoDemoLocalizations
    );
  }

  static Future<NinghaoDemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty == true
        ? locale.languageCode
        : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return NinghaoDemoLocalizations();
    });
  }

  String get title =>
      Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations.',
      );

  String greet(String name) =>
      Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone.',
        args: [name],
      );

}

// 通过arb反过来生成dart文件
// flutter pub pub run intl_translation:generate_from_arb
// --generated-file-prefix=ninghao_demo_ --output-dir=lib/demo/i18n/intl
// --no-use-deferred-loading lib/demo/i18n/intl/ninghao_demo_localizations.dart
// lib/demo/i18n/int/intl_*.arb
// 自己摸索
//flutter pub run intl_generator:generate_from_arb --generated-file-prefix=ninghao_demo_ --output-dir=lib/i18n/intl/ --no-use-deferred-loading lib/i18n/intl/ninghao_demo_localizations.dart lib/i18n/intl/intl_*.arb


class NinghaoDemoLocalizationDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return isContainsThisLanguage(locale);
  }

  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    return NinghaoDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false; // 是否加载本地资源
  }
}
