//
//  CyhomeBooking.swift
//  booking
//
//  Created by HoaPQ on 5/17/21.
//

import Foundation
import UIKit
import Flutter
import FlutterPluginRegistrant

public struct Settings: Codable {
    public var isSandbox: Bool
    public var accessToken: String
    public var language: String
    public var unitGroupId: Int
    public var unitId: Int
    
    public init(isSandbox: Bool, accessToken: String, language: String, unitGroupId: Int, unitId: Int) {
        self.isSandbox = isSandbox
        self.accessToken = accessToken
        self.language = language
        self.unitGroupId = unitGroupId
        self.unitId = unitId
    }
}

public class CyhomeBooking {
    
    private let nativeChannelName = "cyfeer.booking"
    
    public var setting: Settings
    
    lazy var flutterEngine = FlutterEngine(name: "cyhome_booking", project: FlutterDartProject(precompiledDartBundle: Bundle.init(for: Self.self)))
    
    public init(setting: Settings) {
        self.setting = setting
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
    }
    
    public func presentListAmenities(on vc: UIViewController) {
        let viewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let nativeChannel = FlutterMethodChannel(name: nativeChannelName, binaryMessenger: viewController.binaryMessenger)
        var settingMap = self.settingMap
        nativeChannel.setMethodCallHandler { (call, result) in
            if call.method == "initParams" {
                result(settingMap)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        viewController.modalPresentationStyle = .fullScreen
        vc.present(viewController, animated: true, completion: nil)
    }
    
    private var settingMap: [String: Any] {
        guard let data = try? JSONEncoder().encode(setting),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}
