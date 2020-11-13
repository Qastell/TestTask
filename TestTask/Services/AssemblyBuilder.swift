//
//  AssemblyBuilder.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createWelcomeModule(router: RouterProtocol) -> UIViewController
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createRecoveryModule(router: RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    let serviceFactory = ServiceFactory()
    
    func createWelcomeModule(router: RouterProtocol) -> UIViewController {
        let welcomeViewController = WelcomeViewController()
        let presenter = WelcomeViewPresenter(view: welcomeViewController, router: router)
        
        welcomeViewController.presenter = presenter
        return welcomeViewController
    }
    
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let loginViewController = LoginViewController()
        let presenter = LoginViewPresenter(view: loginViewController, router: router, serviceFactory: serviceFactory)
        
        loginViewController.presenter = presenter
        return loginViewController
    }
    
    func createRecoveryModule(router: RouterProtocol) -> UIViewController {
        let recoveryViewController = RecoveryViewController()
        let presenter = RecoveryViewPresenter(view: recoveryViewController, router: router, serviceFactory: serviceFactory)
        
        recoveryViewController.presenter = presenter
        return recoveryViewController
    }
    
}
