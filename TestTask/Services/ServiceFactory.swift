//
//  ServiceFactory.swift
//  TestTask
//
//  Created by Кирилл Романенко on 13.11.2020.
//

import Foundation

protocol ServiceFactoryProtocol {
    func emailCheckService() -> EmailValidateServiceProtocol
}

class ServiceFactory: ServiceFactoryProtocol {
    
    func emailCheckService() -> EmailValidateServiceProtocol {
        return EmailValidateService()
    }
    
}
