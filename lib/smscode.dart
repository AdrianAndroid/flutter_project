import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationBoxCursor extends StatefulWidget {
  final Color? color;
  final double? width;
  final double? indent;
  final double? endIndent;

  const VerificationBoxCursor(
      {Key? key, this.color, this.width, this.indent, this.endIndent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerificationBoxCursorState();
}

class _VerificationBoxCursorState extends State<VerificationBoxCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: VerticalDivider(
        thickness: widget.width,
        color: widget.color,
        indent: widget.indent,
        endIndent: widget.endIndent,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

enum VerificationBoxItemType { underline, box }

class VerificationBoxItem extends StatelessWidget {
  final String? data;
  final VerificationBoxItemType? type;
  final double? borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Decoration? decoration;

  ///
  /// 是否显示光标
  ///
  final bool? showCursor;

  ///
  /// 光标颜色
  ///
  final Color? cursorColor;

  ///
  /// 光标宽度
  ///
  final double? cursorWidth;

  ///
  /// 光标距离顶部距离
  ///
  final double? cursorIndent;

  ///
  /// 光标距离底部距离
  ///
  final double? cursorEndIndent;

  const VerificationBoxItem(
      {Key? key,
      this.data = '',
      this.type,
      this.borderWidth = 2.0,
      this.borderColor,
      this.bgColor = Colors.white,
      this.borderRadius = 5.0,
      this.textStyle,
      this.decoration,
      this.showCursor = false,
      this.cursorColor,
      this.cursorWidth,
      this.cursorIndent,
      this.cursorEndIndent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderColor = this.borderColor ?? Theme.of(context).dividerColor;
    var text = _renderText();
    Widget widget;
    if (type == VerificationBoxItemType.box) {
      widget = _renderBoxDecoration(text, borderColor, bgColor: bgColor!);
    } else {
      widget = _renderUnderlineDecoration(text, borderColor);
    }

    return Stack(
      children: [
        widget,
        showCursor == true
            ? Positioned.fill(
                child: VerificationBoxCursor(
                color: cursorColor ?? Theme.of(context).cursorColor,
                width: cursorWidth!,
                indent: cursorIndent,
                endIndent: cursorIndent,
              ))
            : Container(),
      ],
    );
  }

  Widget _renderUnderlineDecoration(Widget child, Color borderColor) {
    return Container(
      alignment: Alignment.center,
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(width: borderWidth!, color: borderColor),
      ),
      child: child,
    );
  }

  Widget _renderText() {
    return Text(data!, style: textStyle);
  }

  Widget _renderBoxDecoration(Widget child, Color borderColor,
      {Color bgColor = Colors.white}) {
    return Container(
      alignment: Alignment.center,
      decoration: decoration ??
          BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius!),
              border: Border.all(color: borderColor, width: borderWidth!)),
      child: child,
    );
  }
}

class VerificationController {
  late Function cleanData;
  late Function(bool value) onChanged;
}

class VerificationBox extends StatefulWidget {
  final VerificationController? verificationController;
  final int count;
  final double itemWidth;
  final ValueChanged? onSubmitted;
  final VerificationBoxItemType type;
  final Decoration? decoration;
  final Color bgColor;
  final double borderWidth;
  final Color borderColor;
  final Color focusBorderColor;
  final double borderRadius;
  final TextStyle textNormalStyle;
  final TextStyle errorTextStyle;
  final Color errorColor;
  final bool unfocus;
  final bool autoFocus;
  final bool showCursor;
  final Color cursorColor;
  final double cursorWidth;
  final double cursorIndent;
  final double cursorEndIndent;
  final FocusNode? focusNode;

  const VerificationBox(
      {Key? key,
      this.verificationController,
      this.count = 6,
      this.itemWidth = 45,
      this.onSubmitted,
      this.type = VerificationBoxItemType.box,
      this.decoration,
      required this.bgColor,
      this.borderWidth = 2.0,
      required this.borderColor,
      required this.focusBorderColor,
      this.borderRadius = 5.0,
      required this.textNormalStyle,
      required this.errorTextStyle,
      required this.errorColor,
      this.unfocus = true,
      this.autoFocus = true,
      this.showCursor = false,
      required this.cursorColor,
      this.cursorWidth = 2,
      this.cursorIndent = 10,
      this.cursorEndIndent = 10,
      this.focusNode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VerificationBox();
  }
}

class _VerificationBox extends State<VerificationBox>
    with WidgetsBindingObserver {
  final _controller = TextEditingController();
  FocusNode? _focusNode;
  bool _isSubmitting = false;
  List _contentList = [];
  late int numIndex;
  late TextStyle style;
  Color? errorColor;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    style = widget.textNormalStyle;
    WidgetsBinding.instance?.addObserver(this);
    List.generate(widget.count, (index) {
      _contentList.add('');
    });
    widget.verificationController?.cleanData = () {
      cleanData();
    };
    widget.verificationController?.onChanged = (value) {
      if (value) {
        style = widget.errorTextStyle;
        errorColor = widget.errorColor;
      } else {
        style = widget.textNormalStyle;
        errorColor = null;
      }
      if (!mounted) return;
      setState(() {});
    };
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        _popKeyboard();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _popKeyboard();
      },
      child: Stack(
        children: [
          _buildTextField(),
          _buildVerificationBox(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      child: TextField(
        enableInteractiveSelection: false,
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        ),
        cursorWidth: 0,
        autofocus: widget.autoFocus,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: widget.count,
        // buildCounter: (BuildContext context,
        //     {int currentLength, int maxLength, bool isFocused}) {
        //   return Text('');
        // },
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.transparent),
        onChanged: _onValueChange,
      ),
    );
  }

  void _onValueChange(String value) {
    for (int i = 0; i < widget.count; i++) {
      if (i < value.length) {
        _contentList[i] = value.substring(i, i + 1);
      } else {
        _contentList[i] = '';
      }
    }

    if (mounted) {
      setState(() {});
    }

    if (value.length == widget.count &&
        widget.onSubmitted != null &&
        _isSubmitting == false) {
      _isSubmitting = true;
      widget.onSubmitted!(value);
    } else {
      // 执行
    }
  }

  void cleanData() {
    try {
      _contentList = _contentList.map((e) => '').toList();
      _controller.clear();
      _isSubmitting = false;
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      _isSubmitting = false;
    }
  }

  Color _borderColor() {
    if (errorColor != null) {
      return widget.errorColor;
    } else if (_controller.text.length >= numIndex) {
      return widget.focusBorderColor;
    } else {
      return widget.borderColor;
    }
  }

  void _popKeyboard() {
    _focusNode?.unfocus();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // 华为手机上，直接连续调用会无法调
      _focusNode?.requestFocus();
    });
  }

  Widget _buildVerificationBox() {
    return Container(
      child: Positioned.fill(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.count,
            (index) {
              numIndex = index;
              return Container(
                width: widget.itemWidth,
                child: VerificationBoxItem(
                  data: _contentList[index],
                  textStyle: style,
                  type: widget.type,
                  decoration: widget.decoration,
                  borderRadius: widget.borderRadius,
                  borderWidth: widget.borderWidth,
                  borderColor: _borderColor(),
                  showCursor:
                      widget.showCursor && _controller.text.length == index,
                  cursorColor: widget.cursorColor,
                  cursorWidth: widget.cursorWidth,
                  cursorIndent: widget.cursorIndent,
                  cursorEndIndent: widget.cursorEndIndent,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
