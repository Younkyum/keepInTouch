//
//  Extention-Content.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import Foundation
import Contacts
import UIKit

extension ContentView {
    func getContactList() {
        let CNStore = CNContactStore()
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            do {
                let keys = [CNContactPhoneNumbersKey,
                            CNContactGivenNameKey,
                            CNContactFamilyNameKey, 
                            CNContactThumbnailImageDataKey,
                            CNContactOrganizationNameKey,
                            //CNContactNoteKey,
                            CNContactEmailAddressesKey] as [CNKeyDescriptor]
                
                let request = CNContactFetchRequest(keysToFetch: keys)
                request.sortOrder = .userDefault
                
                try CNStore.enumerateContacts(with: request, usingBlock: {contact, _ in
                    contacts.append(contact)
                })
                
            } catch {
                print("error occured while authorized job")
            }
        case .notDetermined:
            print("notDetermined")
            CNStore.requestAccess(for: .contacts) { granted, error in
                if granted {
                    getContactList()
                } else if let error = error {
                    print("Error requesting contact access: \(error)")
                }
            }
        case .restricted:
            print("restriced")
        case .denied:
            print("denied")
        @unknown default:
            print("unknown default")
        }
    }
}
