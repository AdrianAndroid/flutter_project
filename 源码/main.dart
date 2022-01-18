class Test {}

// 第一种
class Singleton1 {
  Singleton1._privateConstructor();

  static final Singleton1 _instance = Singleton1._privateConstructor();

  factory Singleton1() {
    return _instance;
  }
}

class Singleton2 {
  Singleton2._privateConstructor();

  static final Singleton2 _instance = Singleton2._privateConstructor();

  static Singleton2 get instance {
    return _instance;
  }
}

class Singleton3 {
  Singleton3._privateConstructor();

  static final Singleton3 instance = Singleton3._privateConstructor();
}

class Singleton4 {
  factory Singleton4() => const Singleton4._internal_();

  const Singleton4._internal_();
}

class Dio {}

class HttpManager {
  late Dio _dio;

  static HttpManager? _instance;


  factory HttpManager.getInstance() {
     _instance ??= HttpManager._internal_();
     return _instance!;
  }

  HttpManager._internal_(){
    _dio = Dio();
  }

  request() async {
    return "hello";
  }
}

void main() {
  print(HttpManager.getInstance() == HttpManager.getInstance());

  print('---普通---');
  print(Test() == Test());

  print('---工厂构造 Factory constructor---');
  Singleton1 s1 = Singleton1();
  Singleton1 s2 = Singleton1();
  print(s1 == s2);

  print('静态变量 Static Filed with getter');
  print(Singleton2.instance == Singleton2.instance);

  print('静态变量 Static field');
  print(Singleton3.instance == Singleton3.instance);

  print('常量和工厂构造 const constrctor & factory');
  print(Singleton4() == Singleton4());
  print(identical(Singleton4(), Singleton4()));
}
