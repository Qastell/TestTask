//
//  WelcomePresenter.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation

protocol WelcomeViewProtocol: class {
}

protocol WelcomeViewPresenterProtocol {
    init(view: WelcomeViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol?)
    
    func signIn()
}

class WelcomeViewPresenter: WelcomeViewPresenterProtocol {
    
    weak var view: WelcomeViewProtocol?
    let router: RouterProtocol?
    
    required init(view: WelcomeViewProtocol, router: RouterProtocol, serviceFactory: ServiceFactoryProtocol? = nil) {
        self.view = view
        self.router = router
    }
    
    func signIn() {
        router?.go(to: .loginScreen, from: nil)
    }
}
