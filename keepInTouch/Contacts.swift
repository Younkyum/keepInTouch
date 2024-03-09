//
//  Contacts.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import Contacts

let contactsStore = CNContactStore()

var contacts = [CNContact]()

let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
