//
//  Contacts.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import Contacts

class ContactItem: ObservableObject, Identifiable {
    @Published var image: String
    @Published var name: String
    @Published var company: String
    var id: UUID = UUID()
    
    init(image: String, name: String, company: String) {
        self.image = image
        self.name = name
        self.company = company
    }
}


protocol ContactUsable {}


extension ContactUsable {
    
    func getContacts() {
        let store = CNContactStore()
        var _: [ContactItem] = []
        
        let keys = [CNContactThumbnailImageDataKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactJobTitleKey] as [CNKeyDescriptor]
    }
}
