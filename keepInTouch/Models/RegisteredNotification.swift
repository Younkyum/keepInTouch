//
//  RegisteredNotification.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/27/24.
//

import Foundation
import SwiftData
import Contacts

@Model
class RegisteredNotification {
    @Attribute(.unique) var id = UUID()
    var targetName: String
    var targetOrganization: String = ""
    var targetPhoneNumber: String
    var targetEmailAdress: String
    var targetImage: Data
    var cycle: String
    var title: String
    
    init(id: UUID = UUID(), targetName: String, targetOrganization: String, targetPhoneNumber: String, targetEmailAdress: String, targetImage: Data, cycle: String, title: String) {
        self.id = id
        self.targetName = targetName
        self.targetOrganization = targetOrganization
        self.targetPhoneNumber = targetPhoneNumber
        self.targetEmailAdress = targetEmailAdress
        self.targetImage = targetImage
        self.cycle = cycle
        self.title = title
    }
}
