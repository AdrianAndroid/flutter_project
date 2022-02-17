import 'package:event_bus/event_bus.dart';

// 引入eventBus包文件
EventBus eventBus = EventBus();

// 创建EventBus
class EventFn {
  // 想要接收的数据时什么类型的，就定义相同类型的变量
  int count;

  EventFn(this.count);
}

class User {
  int count = 0;

  User({this.count = 0});
}

class Order {
  Order();
}

class UserLoggedInEvent {
  User user;

  UserLoggedInEvent(this.user);
}

class NewOrderEvent {
  Order order;

  NewOrderEvent(this.order);
}
