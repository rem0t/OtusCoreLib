//
//  Configurator.swift
//  
//
//  Created by Влад Калаев on 12.03.2021.
//

import Foundation

public class Configurator {
    
    public static let shared = Configurator()
    
    private init() {
        self.setup()
    }
    
    private func setup() {
        ServiceLocator.shared.addService(service: RecipeApiService() as RecipeApiServiceProtocol)
        // добавять новые сервисы
    }
}
