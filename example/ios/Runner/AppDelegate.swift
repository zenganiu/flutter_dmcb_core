import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      var env = "release"
      #if DEBUG
      env = "debug"
      #elseif PROFILE
      env = "profile"
      #endif
      
      print(env)
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
      
  }
}
