import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Flutter实战*第二版
// https://www.woolha.com/tutorials/flutter-using-futurebuilder-widget-examples

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
      ],
      title: 'Woolha.com Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(title: Text('AlertDialog!!!')),
        body: _TestAlertDialogWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum Department { treasury, state }

class _TestAlertDialogWidget extends StatelessWidget {
  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text('您确定要删除当前文件吗?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); //关闭对话框
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 。。执行删除操作
                Navigator.of(context).pop(true); //关闭对话框
              },
              child: Text('删除'),
            ),
          ],
        );
      },
    );
  }

  // SimpleDialog
  Future<void> _askeToLead(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Department.treasury);
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Department.state);
                },
                child: const Text('State department'),
              )
            ],
          );
        })) {
      case Department.treasury:
        print('Department.treasury');
        break;
      case Department.state:
        print('Department.state');
        break;
      case null:
        print('null');
        break;
    }
  }

  // SimpleDialog
  Future<void> changeLanguage(BuildContext context) async {
    int? i = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('美国英语'),
              ),
            ),
          ],
        );
      },
    );

    if (i != null) {
      print('选择了:${i == 1 ? "中文简体" : "美国英语"}');
    }
  }

  // list dialog
  Future<void> showListDialog(BuildContext context) async {
    int? index = await showDialog(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: [
            ListTile(title: Text('请选择')),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            ),
          ],
        );
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print('点击了: $index');
    }
  }

  // list dialog
  Future<void> showListDialog2(BuildContext context) async {
    int? index = await showDialog(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: [
            ListTile(title: Text('请选择')),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            ),
          ],
        );
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 240),
            child: Material(child: child, type: MaterialType.card),
          ),
        );
      },
    );
    if (index != null) {
      print('点击了: $index');
    }
  }

  //https://book.flutterchina.club/chapter7/dailog.html#_7-7-2-%E5%AF%B9%E8%AF%9D%E6%A1%86%E6%89%93%E5%BC%80%E5%8A%A8%E7%94%BB%E5%8F%8A%E9%81%AE%E7%BD%A9
  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
    ThemeData? theme,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
            },
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      //自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('AlertDialog Title'),
                    content: Text('AlertDialog description'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('官方例子'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _askeToLead(context);
            },
            child: Text('SimpleDialog class'),
          ),
          ElevatedButton(
            onPressed: () async {
              await showListDialog(context);
            },
            child: Text('ShowListDilaog'),
          ),
          ElevatedButton(
            onPressed: () async {
              await showListDialog2(context);
            },
            child: Text('ShowListDilaog222222'),
          ),
          ElevatedButton(
            onPressed: () async {
              await showCustomDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('提示'),
                      content: Text('您确定要删除当前文件吗?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('取消'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('删除'),
                        ),
                      ],
                    );
                  });
            },
            child: Text('ShowCustomDialog()'),
          ),
          ElevatedButton(
            onPressed: () async {
              // 弹出对话框并等待其关闭
              bool? delete = await showDeleteConfirmDialog1(context);
              if (delete == null) {
                print('取消删除!');
              } else {
                print('已确认删除!');
              }
              // ... 删除文件
            },
            child: Text('对话框1'),
          ),
          ElevatedButton(
            onPressed: () {
              changeLanguage(context);
            },
            child: Text('对话框2'),
          ),
          ElevatedButton(
            onPressed: () async {
              // 弹出删除确认对话框，等待用户确认
              bool? deleteTree = await showDeleteConfirmDialog3(context);
              if (deleteTree == null) {
                print('取消删除');
              } else {
                print('同事删除子目录：$deleteTree');
              }
            },
            child: Text('对话框3(复选框可以点击)'),
          ),
          ElevatedButton(
            onPressed: () async {
              await showDeleteConfirmDialog4(context);
            },
            child: Text('对话框4(复选框可以点击) markNeedsBuild'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('对话框4(复选框可以点击)'),
          ),
          ElevatedButton(
            onPressed: () async {
              int? type = await _showModalBottomSheet(context);
              print(type);
            },
            child: Text('底部菜单列表'),
          ),
          ElevatedButton(
            onPressed: () {
              showLoadingDialog(context);
            },
            child: Text('Loading框'),
          ),
          ElevatedButton(
            onPressed: () {
              _showDatePicker1(context);
            },
            child: Text('日历选择'),
          ),
        ],
      ),
    );
  }

  // Loading框
  showLoadingDialog(BuildContext context) {
    bool useOne = false;
    showDialog(
      context: context,
      builder: (context) {
        return useOne
            ? AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 26.0),
                      child: Text('正在加载，请稍后。。。'),
                    ),
                  ],
                ),
              )
            : UnconstrainedBox(
                constrainedAxis: Axis.vertical,
                child: SizedBox(
                  width: 280,
                  child: AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircularProgressIndicator(
                            // value: .8,
                            ),
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: Text("正在加载，请稍后..."),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  // 日历选择
  Future<DateTime?> _showDatePicker1(BuildContext context) {
    bool useIOS = false;
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
              // return SizedBox(
              //   height: 200,
              //   child: CupertinoDatePicker(
              //     mode: CupertinoDatePickerMode.dateAndTime,
              //     minimumDate: date,
              //     maximumDate: date.add(Duration(days: 30)),
              //     onDateTimeChanged: (DateTime value) {
              //       print(value);
              //     },
              //     maximumYear: date.year + 1,
              //   ),
              // );
            },
          );
  }

  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('$index'),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog4(BuildContext context) {
    bool _withTree = false;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('您确定要删除当前文件吗？'),
              Checkbox(
                value: _withTree,
                onChanged: (bool? value) {
                  // 此时context为对话框UI的根Elemment，我们
                  // 直接将对话框UI对应的Element标记为dirty
                  (context as Element).markNeedsBuild();
                  _withTree = !_withTree;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(_withTree),
              child: Text('删除'),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog3(BuildContext context) {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('您确定要删除当前文件吗？'),
              Row(
                children: [
                  Text('同事删除子目录？'),
                  DialogCheckbox(
                    onChanged: (bool? value) {
                      // 更新选中状态
                      _withTree = !_withTree;
                    },
                    value: _withTree,
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('删除'),
              onPressed: () {
                // 将选中的状态返回
                Navigator.of(dialogContext).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }
}

class DialogCheckbox extends StatefulWidget {
  const DialogCheckbox({Key? key, required this.onChanged, this.value})
      : super(key: key);
  final ValueChanged<bool?> onChanged;
  final bool? value;

  @override
  State<StatefulWidget> createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        // 将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          // 更新自身选中状态
          value = v;
        });
      },
    );
  }
}

class StatefulBuilder extends StatefulWidget {
  final StatefulWidgetBuilder builder;

  const StatefulBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

// 测试用
void test() {
  bool? _withTree = false;
  Row(
    children: [
      Text('同时删除子目录?'),
      // 使用StatefuleBuilder来构建StatefulWidget上下文
      StatefulBuilder(builder: (context, _setState) {
        return Checkbox(
            value: _withTree,
            onChanged: (bool? value) {
              // _setState方法实际就是该
            });
      }),
    ],
  );
}
