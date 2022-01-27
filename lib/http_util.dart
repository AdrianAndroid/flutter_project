import 'package:dio/dio.dart';

class Http {
  static BaseOptions options = BaseOptions(
    // 请求基地址，可以包含子路径，如："https://www.google.com/api/"
    baseUrl: "https://google.com/api/",
    //链接服务器超时时间,单位是毫秒
    connectTimeout: 5000,
    // 响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout],
    // [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常
    // 注意：这并不是接收数据的总时限
    receiveTimeout: 3000,
    headers: {},
  );

  static Dio dio = Dio(options);

  static Future get({
    required String path,
    Map<String, String> data = const {},
    options,
    cancelToken,
  }) async {
    print('get请求启动! url:$path, body: $data');
    //data.addAll({'key': newsKey});
    try {
      Response response = await dio.get(
        path,
        queryParameters: data,
        cancelToken: cancelToken,
      );
      print('get请求完成 !response.data:${response.data}');
      return response.data;
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求发生错误:$e');
      }
      print('get请求发生错误:$e');
      return Future.delayed(Duration(seconds: 1));
    }
  }

  static Future post({
    required String path,
    Map<String, String> data = const {},
    options,
    cancelToken,
  }) async {
    print('post请求启动！ url:$path, boy:$data');
    try {
      Response response = await dio.post(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功！response.data:${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消！' + e.message);
      }
      print('post请求发生错误:$e');
      return Future.delayed(Duration(seconds: 1));
    }
  }
}
