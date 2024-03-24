//
//  Extention-Bool.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI


extension Binding where Value == Bool {
    // nagative bool binding same as `!Value`
    // how to use: $value.not == !$value
    var not: Binding<Value> {
        Binding<Value> (
            get: { !self.wrappedValue },
            set: { self.wrappedValue = $0}
        )
    }
}
