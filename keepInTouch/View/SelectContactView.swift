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
    @State var searchText: String = ""
    @Binding var showSelectContactView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(searchResults, id: \.id) { contact in
                        ContactButtonRow(contactData: contact, showSelectContactView: $showSelectContactView)
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .onAppear(perform: getContactList)
                .navigationTitle("연락처 선택")
                .toolbarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("취소") {
                            showSelectContactView = false
                        }
                    }
                })
                .toolbar(.visible, for: .navigationBar)
            }
        }
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
