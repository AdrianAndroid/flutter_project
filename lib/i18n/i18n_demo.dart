import 'package:flutter/material.dart';

import 'intl/ninghao_demo_localizations.dart';

// 手动写的
// import 'package:flutter_project/i18n/ninghao_demo_localizations.dart';
// intl_generator 自动生成的

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${locale.toString()}'),
          Text(
            '${NinghaoDemoLocalizations.of(context)?.title}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '${NinghaoDemoLocalizations.of(context)?.greet('flannery')}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
