//
//  Extension-DetailView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI

extension ContactDetailView {
    func isPhoneNumberThere() -> Bool {
        if contactData.phoneNumbers.isEmpty {
            return false
        }
        return true
    }
    
    func isEmailThere() -> Bool {
        if contactData.emailAddresses.isEmpty {
            return false
        }
        return true
    }
    
    func isNoteThere() -> Bool {
        if contactData.note.isEmpty {
            return false
        }
        return true
    }
}
