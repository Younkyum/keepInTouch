//
//  CurrNotification.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/26/24.
//

import Foundation
import SwiftData



@Model
class CurrNotification {
    @Attribute(.unique) var id = UUID()
    var targetDate: String // "YYYY-MM-DD"
    var isFinished: Bool
    
    @Relationship var regiNotification: RegisteredNotification
    
    init(id: UUID = UUID(), targetDate: String, isFinished: Bool, regiNotification: RegisteredNotification) {
        self.id = id
        self.targetDate = targetDate
        self.isFinished = isFinished
        self.regiNotification = regiNotification
    }
}

