import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Membuat event channel

    let controller = window?.rootViewController as! FlutterViewController

    let eventChannel = FlutterEventChannel(
        name: "my_event_channel",  // Nama channel
        binaryMessenger: controller.binaryMessenger
    )
    
    // Menambahkan listener ke event channel
    eventChannel.setStreamHandler(MyEventStreamHandler())

    GeneratedPluginRegistrant.register(with: self)
    GuardCallback.startLooping()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// StreamHandler untuk menangani peristiwa di event channel
class MyEventStreamHandler: NSObject, FlutterStreamHandler {
    static let shared = MyEventStreamHandler()
    
    private var eventSink: FlutterEventSink?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        sendEvent(data:"Hello")
        sendEvent(data:" Hai")

        sendEvent(data:" Huu")
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }
    
    // Fungsi untuk mengirim peristiwa ke Flutter
    func sendEvent(data: Any) {
        eventSink?(data)
    }
}

// @objc class ViewController: UIViewController {
//   // Swift
//   @objc func receiveFromObjectiveC(_ message: String) {
//       // Lakukan sesuatu dengan data yang diterima
//       print("Received from Objective-C: \(message)")
//   }
// }
