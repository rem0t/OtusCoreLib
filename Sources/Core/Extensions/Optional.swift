//
//  Optional.swift
//  SecondLessonOtus
//
//  Created by Влад Калаев on 28.02.2021.
//

import Foundation

extension Optional where Wrapped == String {
    public var asStringOrEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Int {
    public var asStringOrEmpty: String {
        guard let val = self else { return "" }
        return String(describing: val)
    }
    
    public var asIntOrZero: Int {
        guard let val = self else { return 0 }
        return val
    }
}

extension Optional {
    public var string: String {
        String(describing: self)
    }
    
    public var isNotNil: Bool {
        self != nil
    }
}
