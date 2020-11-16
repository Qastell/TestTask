//
//  RecoveryPresenter.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation

protocol RecoveryViewProtocol: class {
}

protocol RecoveryViewPresenterProtocol {
    init(view: RecoveryViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol?)
    
    func isValid(_ email: String) -> Bool
}

class RecoveryViewPresenter: RecoveryViewPresenterProtocol {
    
    weak var view: RecoveryViewProtocol?
    let router: RouterProtocol?
    let serviceFactory: ServiceFactoryProtocol?
    
    required init(view: RecoveryViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol? = nil) {
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
}
