import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _controller,
          onChanged: _changeText,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _testPinyin,
              child: Text('TEST'),
            ),
            Text('$data'),
          ],
        ),
      ),
    );
  }

  _changeText(String str) {
    if (str.isNotEmpty == true) {
      data = '';
      data = _appendText(str);
      // 字符串拼音首字符
      String shortpy = PinyinHelper.getShortPinyin(str);
      data = _appendText(shortpy);
      // 字符串首字母拼音
      String firstWord = PinyinHelper.getFirstWordPinyin(str);
      data = _appendText(firstWord);
      setState(() {});
    }
  }

  String _appendText(String append) {
    return '$data\n$append';
  }

  _testPinyin() {
    String str = "天府广场";
    // 字符串拼音首字符
    String shortpy = PinyinHelper.getShortPinyin(str); // tfgc

    // 字符串首字拼音
    String firstWord = PinyinHelper.getFirstWordPinyin(str); //tian

    String pinyin1 = PinyinHelper.getPinyin(str); // tian fu guan chang
    String pinyin2 = PinyinHelper.getPinyin(str,
        separator: " ", format: PinyinFormat.WITHOUT_TONE);

    PinyinHelper.getPinyinE(str); //tian fu guang chang
    PinyinHelper.getPinyinE(str,
        separator: " ", format: PinyinFormat.WITHOUT_TONE);

    print("shortpy: " + shortpy);
    print("firstword: " + firstWord);
    print("pinyin1: " + pinyin1);
    print("pinyin2: " + pinyin2);

    String name = "😃";
    String pinyin = PinyinHelper.getPinyin(name, separator: '');
    print('pinyin:$pinyin , length:${name.length} , sub:${name.substring(0)} '
        'FirstWord: ${PinyinHelper.getFirstWordPinyin(name)} , ShortPinyin: '
        '${PinyinHelper.getShortPinyin(name)}');

    // 添加用户自定义字典
    List<String> dict1 = ['耀=yào', '老=lǎo'];
    PinyinHelper.addPinyinDict(dict1); //拼音字典
    List<String> dict2 = ['奇偶=jī,ǒu', '成都=chéng,dū'];
    PinyinHelper.addMultiPinyinDict(dict2); //多音字词组字典
    List<String> dict3 = ['倆=俩', '們=们'];
    ChineseHelper.addChineseDict(dict3); //繁体字字典
  }
}
