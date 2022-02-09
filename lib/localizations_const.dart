import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum LOCAL_TYPE { EN, CH }

const locale_enUs = const Locale('en', 'US');
const locale_zhCN = const Locale('zh', 'CN');
const locale_zhHK = const Locale('zh', 'HK');

const List<Locale> mapLocals = [
  locale_enUs, // 美国英语
  locale_zhCN, // 中文简体
  locale_zhHK,
];

// 是否包含这个语言
bool isContainsThisLanguage(Locale locale) {
  for (var value in mapLocals) {
    if (value.languageCode == locale.languageCode) {
      return true;
    }
  }
  return false;
}

bool isZhLanguages(Locale locale) {
  return locale.languageCode == 'zh';
}

String getLocalName(LOCAL_TYPE type) {
  String name = "";
  switch (type) {
    case LOCAL_TYPE.CH:
      name = "中文";
      break;
    case LOCAL_TYPE.EN:
      name = "English";
      break;
  }
  return name;
}

// 转换语言
LOCAL_TYPE toggleLocal(LOCAL_TYPE local_type) {
  LOCAL_TYPE type = local_type;
  int lastIndex = LOCAL_TYPE.values.length - 1;
  if (local_type.index < lastIndex) {
    type = LOCAL_TYPE.values[local_type.index + 1];
  } else if (local_type.index == lastIndex) {
    type = LOCAL_TYPE.values[0]; // 获取第一个值
  } else {
    type = LOCAL_TYPE.values[0];
  }
  return type;
}

// Locale资源类
class DemoLocalizations {
  DemoLocalizations(this.isZh);

  // 是否为中文
  bool isZh = false;

  // 为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  // Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  // 是否支持某个Local
  @override
  bool isSupported(Locale locale) {
    return isContainsThisLanguage(locale);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    print('$locale');
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(isZhLanguages(locale)));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}
