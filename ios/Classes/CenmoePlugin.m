#import "CenmoePlugin.h"
#if __has_include(<cenmoe_plugin/cenmoe_plugin-Swift.h>)
#import <cenmoe_plugin/cenmoe_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cenmoe_plugin-Swift.h"
#endif

@implementation CenmoePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCenmoePlugin registerWithRegistrar:registrar];
}
@end
