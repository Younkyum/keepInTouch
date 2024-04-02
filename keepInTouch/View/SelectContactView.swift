//
//  SelectContactView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/27/24.
//

import SwiftUI
import Contacts


struct SelectContactView: View {
    @State var contactList: [CNContact] = []
    @Binding var targetName: String?
    @Binding var targetNumber: String?
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.id) { contact in
                    ContactRow(contactData: contact, targetName: $targetName, targetNumber: $targetNumber)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .onAppear(perform: getContactList)
        .navigationTitle("연락처 선택")
    }
}


extension SelectContactView {
    var searchResults: [CNContact] {
        if searchText == "" {
            return contactList
        } else {
            return contactList.filter { $0.givenName.contains(searchText) || $0.familyName.contains(searchText) ||  "\($0.familyName)\($0.givenName)".contains(searchText) }
        }
    }
}
