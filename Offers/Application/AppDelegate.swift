//
//  AppDelegate.swift
//  Offers
//
//  Created by Bassem Abbas on 6/4/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppManager.launchApp(application)
        self.window = AppManager.shared.window
        
        for family in UIFont.familyNames {

                  let sName: String = family as String
                  print("family: \(sName)")
                          
                  for name in UIFont.fontNames(forFamilyName: sName) {
                      print("\t name: \(name as String)")
                  }
              }
        
                return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
