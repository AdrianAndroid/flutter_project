import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/localizations_const.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/i18n_demo.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale_enUs,
      localizationsDelegates: [
        // 本地化的代理类
        // 为Material组件库提供的本地化的字符串和其他值，它可以使Material组建支持多语言
        GlobalMaterialLocalizations.delegate,
        // 定义组件默认的文本方向，从左到右或从右到左，这是因为有些语言的阅读习惯不是从左到右
        GlobalWidgetsLocalizations.delegate,
        // 注册我们自己的Delegate
        DemoLocalizationsDelegate()
      ],
      supportedLocales: mapLocals,
      title: 'Woolha.com Flutter Tutorial',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LOCAL_TYPE local_type = LOCAL_TYPE.CH;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
        centerTitle: true,
        backgroundColor: Colors.green,
        brightness: Brightness.dark,
        //automaticallyImplyLeading: false,
        leading: Icon(Icons.add),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                //local_type = toggleLocal(local_type);
                _showDatePicker1(context);
              });
            },
            icon: Icon(Icons.toggle_on),
          ),
        ],
      ),
      body: I18nDemo(),
      // body: Center(
      //   child: Text(getLocalName(local_type)),
      // ),
    );
  }

  // 日历选择
  Future<DateTime?> _showDatePicker1(BuildContext context) {
    bool useIOS = true;
    var date = DateTime.now();
    return useIOS
        ? showDatePicker(
            context: context,
            initialDate: date,
            firstDate: date,
            lastDate: date.add(Duration(days: 30)),
          )
        : showCupertinoModalPopup(
            context: context,
            builder: (ctx) {
              return Container(
                height: 200,
                color: Colors.white,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  minimumDate: date,
                  maximumDate: date.add(Duration(days: 30)),
                  onDateTimeChanged: (DateTime value) {
                    print(value);
                  },
                  maximumYear: date.year + 1,
                ),
              );
            },
          );
  }
}
