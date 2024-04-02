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
    var targetPhoneNumber: String = ""
    var targetEmailAdress: String = ""
    var thumbNailData: Data?
    var cycle: String
    var title: String
    
    init(id: UUID = UUID(), targetName: String, targetOrganization: String, targetPhoneNumber: String, targetEmailAdress: String, thumbNailData: Data? = nil, cycle: String, title: String) {
        self.id = id
        self.targetName = targetName
        self.targetOrganization = targetOrganization
        self.targetPhoneNumber = targetPhoneNumber
        self.targetEmailAdress = targetEmailAdress
        self.thumbNailData = thumbNailData
        self.cycle = cycle
        self.title = title
    }
}
