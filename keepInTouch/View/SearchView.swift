//
//  SearchView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/22/24.
//

import SwiftUI
import Contacts

struct SearchView: View {
    @Binding var contacts: [CNContact]
    @State var searchString: String = ""
    
    
    private var searchResults : [CNContact] {
        searchString.isEmpty ? contacts : contacts.filter { $0.familyName.contains(searchString) || $0.givenName.contains(searchString) || $0.organizationName.contains(searchString) || "\($0.familyName)\($0.givenName)".contains(searchString)}
    }
    
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack(alignment: .leading, content: {
                    List(searchResults, id: \CNContact.id) { contactDetail in
                        ContactCellView(contactData: contactDetail)
                            .listRowBackground(Color.clear)
                    }
                    .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always))
                    .listStyle(.plain)
                    .navigationTitle("전화번호부 검색")
                    .scrollContentBackground(.hidden)
                    
                })
                .background(.backgroundWhite)
            }
            .navigationBarTitleDisplayMode(.large)
            .background(.backgroundWhite)
        }
        .background(.backgroundWhite)
    }
}

