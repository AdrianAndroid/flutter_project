import 'package:dio/dio.dart';

const String BASEURL = "https://www.wanandroid.com";

class HttpConfig {
  static const baseUrl = BASEURL;
  static const timeout = 3000;
}

class RequestManager {
  static final BaseOptions options = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout,
  );

  static final Dio dio = Dio(options);

  static Future<T> request<T>(
    String url, {
    String method = 'get',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    final options = Options(method: method);
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {},
      onResponse: (
        Response e,
        ResponseInterceptorHandler handler,
      ) {},
      onError: (
        DioError e,
        ErrorInterceptorHandler handler,
      ) {},
    );

    List<Interceptor> inters = [dInter];
    if (interceptor != null) {
      inters.add(interceptor);
    }
    dio.interceptors.addAll(inters);
    // 发送网络请求
    try {
      Response response = await dio.request<T>(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
