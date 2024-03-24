//
//  HomeView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI
import Contacts


struct HomView: View {
    @State public var contacts = [CNContact]()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, content: {
                TitleBarRow(contacts: $contacts)
                    .background(.backgroundWhite)
                List(contacts, id: \CNContact.id) { contactDetail in
                    ContactCellView(contactData: contactDetail)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                
            })
            .background(.backgroundWhite)
        }
        .onAppear(perform: getContactList)
    }
}


// MARK: - Preview
#Preview {
    HomView()
}


