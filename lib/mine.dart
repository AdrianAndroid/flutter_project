import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/smscode.dart';

class Mine extends StatefulWidget {
  const Mine();

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(flex: 1, child: Expanded(child: TextFieldWidget())),
      SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                  tag: 'about_title',
                  child: OutlineButton(
                    onPressed: () => {Navigator.pushNamed(context, "/about")},
                    child: Text("about"),
                  )),
              OutlineButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, "/gallery/about")},
                child: Text("gallery about"),
              )
            ],
          ))
    ]);
  }

  Widget _buildTextField() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              /*边角*/
              borderRadius: BorderRadius.all(
                Radius.circular(30), //边角为30
              ),
              borderSide: BorderSide(
                color: Colors.amber, //边线颜色为黄色
                width: 2, //边线宽度为2
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.green, //边框颜色为绿色
              width: 5, //宽度为5
            )),
            labelText: "labelText",
            helperText: "helperText",
            // errorText: "errorText",
            hintText: "hintText",
            prefixIcon: Icon(Icons.perm_identity),
          ),
          onChanged: (_val) {
            print(_val);
          },
          onEditingComplete: () {
            print("点击了键盘上的动作按钮!");
          },
          onSubmitted: (_val) {
            print("点击了键盘上的动作按钮，当前输入框的值为${_val}");
          },
          inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z]"))],
          textInputAction: TextInputAction.search,
        ),
        TextField(
          decoration: InputDecoration(
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.amber, width: 2),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 5),
            ),
            labelText: "labelText",
            helperText: "helperText",
            errorText: "errorText",
            hintText: "hintText",
            prefixIcon: Icon(Icons.perm_identity),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.go,
        ),
      ],
    );
  }

  VerificationController _verificationController = VerificationController();

  Widget _buildSmsCode() {
    return Container(
      child: VerificationBox(
        textNormalStyle: TextStyle(
          color: new Color(0xFF1B1B26),
          fontSize: 24,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.6,
        ),
        verificationController: _verificationController,
        showCursor: true,
        itemWidth: 44,
        autoFocus: true,
        cursorWidth: 2,
        cursorColor: Color(0xFFFF265C),
        cursorIndent: 10,
        cursorEndIndent: 10,
        borderRadius: 2,
        borderWidth: 0.5,
        bgColor: Color(0xFFF5F5FA),
        type: VerificationBoxItemType.box,
        focusBorderColor: Color(0xFFE1E1E6),
        onSubmitted: (value) async {
          // viewModel.onSubmitted(
          //     value, widget.phoneNum, widget.phoneCode, context,
          //     callback: widget.loginCallBack);
        },
        errorColor: Colors.yellow,
        errorTextStyle: TextStyle(
          color: Color(0xFFFF265C),
          fontSize: 24,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.6,
        ),
        borderColor: Colors.transparent,
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {
  TextEditingController _userEtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: _userEtController),
            RaisedButton(
              child: Text("赋值"),
              onPressed: () {
                _userEtController.text = "15937000045";
              },
            ),
            RaisedButton(
              child: Text("获取值"),
              onPressed: () {
                setState(() {});
              },
            ),
            Text(_userEtController.text),
          ],
        ),
      ),
    );
  }
}
