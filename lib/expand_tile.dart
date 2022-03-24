import 'package:flutter/material.dart';

class ExpandTile extends StatefulWidget {
  final bool maintainState;
  final ValueChanged<bool>? onExpansionChanged;

  /// The primary content of the list item
  final Widget title;

  /// The widgets that are displayed when the tile expands.
  final List<Widget> children;

  const ExpandTile({
    Key? key,
    required this.title,
    this.maintainState = false,
    this.onExpansionChanged,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExpandTileState();
}

class ExpandTileState extends State<ExpandTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns; // 转弯的箭头
  late Animation<double> _heightFactor;

  // late Animation<Color?> _headerColor;
  // late Animation<Color?> _iconColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    // _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    // _iconColor = _controller.drive(_iconColorTween.chain(_easeOutTween));
  }

  _buildTrailingIcon(BuildContext context) {
    return _buildIcon(context);
  }

  _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.expand_more),
    );
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then((value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(color: Colors.transparent),
          bottom: BorderSide(color: Colors.transparent),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _handleTap,
            child: Row(
              children: [
                Expanded(child: widget.title),
                _buildTrailingIcon(context),
              ],
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}

class _ExpandListTile extends StatelessWidget {
  final ShapeBorder? shape;
  final bool enabled;
  final FocusNode? focusNode;
  final Color? focusColor;
  final Color? hoverColor;
  final bool autofocus;
  final bool? enableFeedback;
  final bool selected;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final MouseCursor? mouseCursor;

  const _ExpandListTile({
    Key? key,
    this.shape,
    this.enabled = true,
    this.focusNode,
    this.focusColor,
    this.hoverColor,
    this.autofocus = false,
    this.enableFeedback,
    this.selected = false,
    this.onTap,
    this.mouseCursor,
    this.onLongPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MouseCursor resolveMouseCursor =
        MaterialStateProperty.resolveAs<MouseCursor>(
      mouseCursor ?? MaterialStateMouseCursor.clickable,
      <MaterialState>{
        if (!enabled || (onTap == null && onLongPress == null))
          MaterialState.disabled,
        if (selected) MaterialState.selected,
      },
    );

    return InkWell(
      customBorder: shape,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      mouseCursor: resolveMouseCursor,
      canRequestFocus: enabled,
      focusNode: focusNode,
      focusColor: focusColor,
      hoverColor: hoverColor,
      autofocus: autofocus,
      enableFeedback: enableFeedback ?? true,
      child: Semantics(
        selected: selected,
        enabled: enabled,
        child: Ink(
          decoration: ShapeDecoration(
            shape: shape ?? const Border(),
          ),
          child: Ink(
            decoration: ShapeDecoration(shape: shape ?? const Border()),

          ),
        ),
      ),
    );
  }
}
