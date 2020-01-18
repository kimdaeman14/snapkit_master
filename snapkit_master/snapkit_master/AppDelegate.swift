//
//  AppDelegate.swift
//  snapkit_master
//
//  Created by 디엠에듀 on 2020/01/17.
//  Copyright © 2020 Jaycee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var mainNavigationController: UINavigationController?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.makeMain()
    return true
  }
  
  
}


extension AppDelegate {
  func makeMain() {
    self.mainNavigationController = UINavigationController()
    let viewController: UIViewController = ListViewController()
    self.mainNavigationController?.pushViewController(viewController, animated: false)
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = self.mainNavigationController
    self.window?.backgroundColor = UIColor.white
    self.window?.makeKeyAndVisible()
  }
}


