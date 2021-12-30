import 'package:flutter/material.dart';
import 'package:providers/provider_home.dart';

class GalleryRouteGenerator {
  //配置路由
  static final routes = {
    "/": (context, {arguments}) => ProviderHome(name: '画廊'),
    // "/gallery/detail": (context, {arguments}) => Detail(gallery: arguments),
    // "/gallery/about": (context, {arguments}) => GalleryAbout(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageContentBuilder = routes[name!];
    if (pageContentBuilder != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      return _errorPage('找不到页面');
    }
  }

  static Route _errorPage(msg) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('未知页面')), body: Center(child: Text(msg)));
    });
  }
}
