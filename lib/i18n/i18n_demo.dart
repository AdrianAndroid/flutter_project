import 'package:flutter/material.dart';
import 'package:flutter_project/i18n/ninghao_demo_localizations.dart';

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
            '${Localizations.of(context, NinghaoDemoLocalizations).title}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
