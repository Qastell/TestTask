//
//  LoginPresenter.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation
import UIKit

protocol LoginViewProtocol {
}

protocol LoginViewPresenterProtocol {
    init(view: LoginViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol?)
    
    func isValid(_ email: String) -> Bool
    func goToRecoveryScreen(from: UIViewController?)
}

class LoginViewPresenter: LoginViewPresenterProtocol {
    
    var view: LoginViewProtocol?
    let router: RouterProtocol?
    let serviceFactory: ServiceFactoryProtocol?
    
    required init(view: LoginViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol? = nil) {
        self.view = view
        self.router = router
        self.serviceFactory = serviceFactory
    }
    
    func isValid(_ email: String) -> Bool {
        if let emailValidater = serviceFactory?.emailCheckService() {
            return emailValidater.isValid(email)
        }
        return false
    }
    
    func goToRecoveryScreen(from: UIViewController? = nil) {
        router?.go(to: .passwordScreen, from: from)
    }
    
}
