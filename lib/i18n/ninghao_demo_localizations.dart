import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/i18n/intl/ninghao_demo_messages_all.dart';
import 'package:intl/intl.dart';
import '../localizations_const.dart';

// 手动版本
class NinghaoDemoLocalizations {
  final Locale locale;
  NinghaoDemoLocalizations(this.locale);

  static NinghaoDemoLocalizations? of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
        context, NinghaoDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    },
  };

  String? get title {
    Map<String, String>? map = _localized[locale.languageCode];
    return map == null ? null : map['title'];
  }
}

class NinghaoDemoLocalizationDelegate
    extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return isContainsThisLanguage(locale);
  }

  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<NinghaoDemoLocalizations>(
        NinghaoDemoLocalizations(locale));
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false; // 是否加载本地资源
  }
}
