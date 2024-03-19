//
//  ContactsModel.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import Foundation
import UIKit
import Contacts

struct ContactsModel {
    let identifier = UUID()
    var givenName: String
    var familyName: String
    var phoneNumber: String
    var jobTitle: String
    
    init(givenName: String, familyName: String, phoneNumber: String, emailAddress: String, identifier: String, jobTitle: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.phoneNumber = phoneNumber
        self.jobTitle = jobTitle
    }
}
