//
//  Router.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation
import UIKit

enum RouteScreen {
    case loginScreen
    case passwordScreen
}

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
    
    func go(to screen: RouteScreen, from: UIViewController?)
    func initionalViewController()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController?, assemblyBuilder: AssemblyBuilderProtocol?) {
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController
    }
    
    func go(to screen: RouteScreen, from: UIViewController? = nil) {
        switch screen {
        case .loginScreen:
            if let navigationController = navigationController {
                guard let controller = assemblyBuilder?.createLoginModule(router: self) else { return }
                navigationController.pushViewController(controller, animated: true)
            }
        case .passwordScreen:
            guard let controller = assemblyBuilder?.createRecoveryModule(router: self) else { return }
            from?.present(controller, animated: true)
        }
    }
    
    func initionalViewController() {
        if let navigationController = navigationController {
            guard let welcomeViewController = assemblyBuilder?.createWelcomeModule(router: self) else { return }
            navigationController.viewControllers = [welcomeViewController]
        }
    }
    
}
