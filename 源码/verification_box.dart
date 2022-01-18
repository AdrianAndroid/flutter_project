// class VerificationController {
//     Function cleanData;
//     Function(bool value) onChanged;
// }
//
// class VerificationBox extends StatefuleWidget {
//     const VerificationBox({
//         this.verificationController,
//         this.count = 6,
//         this.itemWidth = 45,
//         this.onSubmitted,
//         this.type = VerificationBoxItemType.box,
//         this.decoration,
//         this.borderWith = 2.0,
//         this.borderRadius = 5.0;
//         this.textNormalStyle,
//         this.errorTextStyle,
//         this.focusBorderColor,
//         this.borderColor,
//         this.errorColor,
//         this.unfocus = true,
//         this.autoFocus = true,
//         this.showCursor = false,
//         this.cursorWth = 2,
//         this.cursorColor,
//         this.bgColor,
//         this.cursorIndent = 10,
//         this.cursorEndIndent = 10,
//         this.focusNode,
//     });
//
//         /// Control
//         final VerificationController verificationController;
//
//         // 几位验证码，一般6位，还有4位
//         final int count;
//
//         // 每一个Item的宽
//         final double itemWidth;
//
//         /// 输入完成回调
//         final ValueChanged onSubmitted;
//
//         //每个item的装饰类型
//         final VerificationBoxItemType type;
//
//         // 每个item的样式
//         final Decoration decoration;
//
//         /// 每个item的背景
//         final Color bgColor;
//
//         // 边框宽度
//         final double borderWidth;
//
//         // 边框颜色
//         final Color borderColor;
//
//         // 获取焦点边框的颜色
//         final Color docusBorderColor;
//
//         // 边框圆角
//         final double borderRadius;
//
//         /// 文本正常样式
//         final TextStyle textNormalStyle;
//
//         /// 文本错误提示样式
//         final TextStyle errorTextStyle;
//
//         /// 下划线错误提示颜色
//         final Color errorColor;
//
//         /// 输入完成后是否失去焦点，默认true， 失去焦点后，软键盘消失
//         final bool unfocus;
//
//         /// 是否自动获取焦点
//         final bool autoFocus;
//
//         /// 是否自动获取光标
//         final bool showCursor;
//
//         /// 光标颜色
//         final Color cursorColor;
//
//         /// 光标宽度
//         final double cursorWidth;
//
//         /// 光标距离顶部距离
//         final double cursorIndent;
//
//         /// 光标距离底部距离
//         final double curosorEndIndent;
//
//         /// 输入框焦点
//         final FocusNode focusNode;
//
//         @ooverride
//         State<StatefulWidget> craeteState() => _VerificationBox();
// }
//
//
// class _VerificationBox extends State<VerificationBox> with WidgetsBindingObserver {
//
//     final _controller = TextEditingController();
//     FocusNode _focusNode;
//
//     bool _isSubmitting = false;
//     List _contentList = [];
//     int numIndex;
//     /// 当前文本显示的样式
//     TextStyle style;
//     /// 当前下划线的颜色
//     Color errorColor;
//
//     @override
//     void initState() {
//         _focusNode = widget.focusNode ?? FocusNode();
//         style = widget.textNormalStyle;
//         WidgetsBindingObserver.instance.addObserver(this);
//         List.generate(widget.count, (index){
//             _contentList.add('');
//         });
//         widget.verificationController.cleanData = () {
//             cleanData();
//         };
//         widget.vreficationController.onChanged = (value) {
//             if (value) {
//                 style = widget.errorTextStyle;
//                 errorColor = widget.errorColor;
//             } else {
//                 style = widget.textNormalStyle;
//                 errorColor = null;
//             }
//             if (!mounted) return;
//             setState((){});
//         }
//         super.initState();
//     }
//
//     @override
//     void didChangeAppLifecycleState(AppLifecycleState state) {
//         switch(state) {
//             case AppLifecycleState.inactive: break;
//             case AppLifecycleState.resumed: _popKeyboard(); break;
//             case AppLifecycleState.paused: break;
//             case AppLifecycleState.detached: break;
//         }
//     }
//
//     @override
//     void dispose() {
//         WidgetBinding.instance.removeObserver(this);
//         super.dispose();
//     }
//
//     @override
//     Widget build(BuildContext context) {
//         return GestureDetector(
//             onTap():(){
//                 _popKeyboard();
//             },
//             child: Stack(
//                 children: <Widget>[
//                     _buildTextField(),
//                     _buildVerificationBox(),
//                 ],
//             ),
//         );
//     }
//
//     // 构建TextField
//     Widget _buildTextField() {
//         return Container(
//             child: TextField(
//                 enableInteractiveSelection: false,
//                 controller: _controller,
//                 focusNode: _focusNode,
//                 decoration: InputDecoration(
//                     border: UnderlineInputBorder(borderSide: BorderSide(color: ThemeColor.transparent)),
//                     enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeColor.transparent)),
//                     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeColor.transparent)),
//                 ),
//                 cursorWidth: 0,
//                 audofocus: widget.autoFocus,
//                 inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly, ],
//                 maxLength: widget.count,
//                 buildCounter: (BuildContext context, int currentLength, int maxLength, bool isFocused) { return Text('') },
//                 keyboardType: TextInputType.number,
//                 style: TextStyle(color: ThemeColor.transparent),
//                 onChanged: _onValueChange,
//             ),
//         );
//     }
//
//     void _onValueChange(String value) {
//         for (int i = 0; i < widget.count; i++) {
//             if (i < value.length) {
//                 _contentList[i] = value.substring(i, i+1);
//             } else {
//                 _contentList[i] = '';
//             }
//         }
//         if(mounted) {
//             setState((){});
//         }
//         if (value.length == widget.count && widget.onSubmitted != null && _isSubmitting == false) {
//             terra.log.d(VerificationBox.TAG, "调用 onSubmited");
//             _isSubmitting = true;
//             widget.onSubmitted(value);
//         } else {
//             // 执行
//             terra.log.d(VerificationBox.TAG, "not call submit _isSubmitting: $_isSubmitting, value.length:${valuelength}");
//         }
//     }
//
//     void cleanData() {
//         try {
//             terra.log.d(VerficationBox.TAG, "box cleanData");
//             _contentList  _contentList?.map((t) => '')?.toList();
//             _controller.clear();
//             _isSubmitting = false;
//             terra.log.d(VerificationBox.TAG, "box _isSubmitting $_isSubmitting");
//             if (mounted) {
//                 setState((){});
//             }
//         } catch (e) {
//             terra.log.d(VerficationBox.TAG, "box _isSubmitting failed $_isSubmitting");
//             _isSubmitting = false;
//         }
//     }
//
//     Color _bordercolor() {
//         if (errorColor != null) {
//             return widget.errorColor;
//         } else if(_controller.text.length >= numIndex) {
//             return widget.focusBorderColor;
//         } else {
//             return widget.borderColor;
//         }
//     }
//
//     void _popKeyboard() {
//         _focusNode.unfocus();
//         WidgetwBinding.instance.addPostFameCallbac((timeStamp){
//             // 华为手机上，直接连续调用会无法调起
//             _focusNode.requestFocus();
//         });
//     }
//
//     Widget _buildVerifcationBox() {
//         return Container(
//             child: Positioned.fill(
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: List.generate(
//                         widget.count,
//                         (index) {
//                             numIndex = index;
//                             return Container(
//                                 width: widget.itemWidth,
//                                 child: VerficationBoxItem(
//                                     data: _contentList[index],
//                                     textStyle: style,
//                                     type: widget.type,
//                                     decoration: widget.decoration,
//                                     borderRadius: widget.borderRadius,
//                                     borderWidth: widget.borderWidth,
//                                     bordercolor: _bordercolor(),
//                                     bgColor: widget.bgColor,
//                                     showCursor: widget.showCursor && _controller.text.length == index,
//                                     cursorColor: widget.cursorColor,
//                                     cursorColor: widget.cursorColor,
//                                     cursorWidth: widget.cursorWidth,
//                                     cursorIndent: widget.cursorIndent,
//                                     cursorEndIndent: widget.cursorEndIndent,
//                                 ),
//                             );
//                         }
//                     ),
//                 ),
//             );
//         );
//     }
// }