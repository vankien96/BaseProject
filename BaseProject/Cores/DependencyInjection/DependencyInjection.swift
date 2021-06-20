//
//  DependencyInjection.swift
//  BaseProject
//
//  Created by Trương Văn Kiên on 09/06/2021.
//

import Foundation
import Swinject

class DependencyInjection {
    static let shared = DependencyInjection()
    
    private let container: Container
    
    private init() {
        container = Container()
        // register repository
        container.register(UserRepository.self, name: nil) { _ in UserRepositoryImpl() }
        
        container.register(AuthUsecase.self, name: nil) { resolver in
            return AuthUsecaseData(userRepository: resolver.resolve(UserRepository.self)!)
        }
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = container.resolve(serviceType) else {
            fatalError("Please register service before using it")
        }
        return service
    }
}
