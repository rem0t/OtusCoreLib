//
//  AppConfig.swift
//  
//
//  Created by Влад Калаев on 15.03.2021.
//

import Foundation

public class AppConfig {
    
    public static let shared = AppConfig()
    
    private init() {
        self.setup()
    }
    
    private func setup() {
        ServiceLocator.shared.addService(service: RecipeApiService() as RecipeApiServiceProtocol)
    }
}
