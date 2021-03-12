//
//  ServiceLocator.swift
//  
//
//  Created by Влад Калаев on 12.03.2021.
//

import Foundation

public protocol ServiceLocator {
    
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

public class ServiceLocator: ServiceLocator {
    
    public static let shared = ServiceLocator()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    public func getService<T>(type: T.Type) -> T? {
        return self.services[String(describing: type)] as? T
    }
    
    public func addService<T>(service: T) {
        let type = String(describing: T.self)
        if self.services[type] == nil {
            self.services[type] = service
        }
    }
}
