//
//  View.swift
//  SecondLessonOtus
//
//  Created by Влад Калаев on 28.02.2021.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    public let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    public init(_ build: @escaping () -> Content) {
        self.build = build
    }

    public var body: Content {
        build()
    }
}
