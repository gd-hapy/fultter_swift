import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let messenger : FlutterBinaryMessenger = window?.rootViewController as! FlutterBinaryMessenger
         
     testPlugin(messenger: messenger)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


    func testPlugin(messenger: FlutterBinaryMessenger) {
        let channel = FlutterMethodChannel(name: "plugin_apple", binaryMessenger: messenger)
        channel.setMethodCallHandler {  (call, result) in
            if (call.method == "apple_one") {
                result(["result":"success","code":200, "data":"apple_one"]);
            }
            
            if (call.method == "apple_two") {
                result(["result":"success","code":404,"data":"apple_one"]);
            }
        }
    }
}
