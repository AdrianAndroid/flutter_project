#import "Plugin3Plugin.h"
#if __has_include(<plugin3/plugin3-Swift.h>)
#import <plugin3/plugin3-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin3-Swift.h"
#endif

@implementation Plugin3Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlugin3Plugin registerWithRegistrar:registrar];
}
@end
