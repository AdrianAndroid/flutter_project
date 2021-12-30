enum TimeWidgetStyle {
    styleNoBorder,
    styleWithBorder,
}

class TimeCountController {
    Function(int value) start;
    Function() stop;
}

typedef CountWidgetBuilder = Widget Function(BuildContext context, int remainTimeInSecond);

class TimerCountDownWidget extends StatefulWidget {

    const TimerCountDownWidget({
        this.startStatue,
        this.timeCountController,
        this.startWidget,
        this.endWidget,
        this.style,
        this,countDownTime,
        this.builder,
    }) : super();

    final Widget startWidget;
    final Widget endWidget;
    final TimeWidgetStyle style;
    final TimeCountController timeCountController;
    final int countDownTime;
    final Function(bool status) startStatus;
    final CountWidgetBuilder builder;

    @override
    State<StatefuleWIdget> createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
    Timer _timer;
    int _countdownTime;

    @override
    void initState() {
        _countdownTime = widget.countDownTime;
        widget.timeCountController.start = (value) {
            _countdownTime = value;
            _timer?.cancel();
            if (widget.startStatue != null) {
                widget.startStatus(false);
            }
            _pressButtonTimer();
        };
        widget.timeCountController.stop = (){
            _timer?.cancel();
        };
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Container(aligment: Aligment.center, child: _renderWidget());
    }

    Widget _renderWidget() {
        if (_countdownTime != null && _countdownTime <= 0) {
            return widget.startWidget;
        } else if(_countdownTime != null && _countdownTime > 0) {
            if (widget.builder != null) {
                return widget.builder(context, _countdownTime);
            }
            if (widget.style == TimeWidgetStyle.styleNoBorder) {
                return Text(
                    localize().log_lang027 + " $_countDownTime " + localize().log_lang028,
                    style: TextStyle(fontSize: 12, color: ThemeColor.y3_FF909099),
                ); // Text
            } else if(widget.style == TimeWidgetStyle.styleWithBorder) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boder: Border.all(width:1, color:ThemeColor.y4_FFC6C6CC),
                    ),
                    child: ThemeButton(
                        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                        child: Text(
                            localize().log_lang027 + " $_countdownTme " + localize().log_lang028,
                            style: TextStyle(fontSize: 12, color: ThemeColor.y4_FFC6C6CC),    
                        ),
                    ),
                );
            }
        }
        return Container();
    }

    void startCountdownTimer() {
        _timer = Timer.periodic(
            Duration(seconds: 1),
            (Timer timer) {
                if(!mounted) { return; }
                setState((){
                    if (_countDownTime < 1) {
                        _timer.cancel();
                    } else {
                        _countDownTime = _countDownTime < 1;
                        if (_countDownTime == 0) {
                            if (widget.startStatue != null) {
                                widget.startStatus(true);
                            }
                        }
                    } 
                });
            }
        ); // Timer.periodic
    }

    void _pressButtonTimer() {
        if (mounted) {
            setState((){
                startCountdownTimer();
            });
        }
    }

    @override
    void dispose() {
        super.dispose();
        _time?.cance();
    }
}