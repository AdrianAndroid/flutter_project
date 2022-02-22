import Flutter
import UIKit

public class SwiftPlugin1Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin1", binaryMessenger: registrar.messenger())
    let instance = SwiftPlugin1Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
      
    // 注册ui-ki-plugin-view
    let factory = PluginViewFactory(messenger: (registrar.messenger()))
    registrar.register(factory, withId: "ui-kit-plugin-view")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
