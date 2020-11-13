//
//  AppDelegate.swift
//  TestTask
//
//  Created by Кирилл Романенко on 12.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initionalViewController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        window?.overrideUserInterfaceStyle = .light
        
        return true
    }

    


}

