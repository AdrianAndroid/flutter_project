import 'package:flutter/material.dart';
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
      Expanded(flex: 1, child: Expanded(child: _buildTextField())),
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
            icon: Icon(Icons.person),
            labelText: "labelText",
            helperText: "helperText",
            errorText: "errorText",
            hintText: "hintText",
            prefixIcon: Icon(Icons.perm_identity),
            prefixText: "prefixText",
            suffixIcon: Icon(Icons.remove_red_eye),
            suffixText: "suffixText",
            counterText: "counterText",
            filled: true,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            prefixIcon: Icon(Icons.perm_identity),
            labelText: "手机号",
            helperText: "用户名为手机号或者登陆邮箱",
            errorText: "手机号码不正确",
            hintText: "请输入手机号码",
            prefixText: "+86",
            suffixIcon: Icon(Icons.remove_red_eye),
            suffixText: "隐藏输入文本",
            counterText: "0/10",
            filled: true,
            fillColor: Colors.green,
          ),
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
