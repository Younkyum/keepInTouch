//
//  TitleBarRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI
import Contacts


struct TitleBarRow: View {
    @State private var showPlusModal = false
    @State private var showSettingModal = false
    @State private var showSearchModal = false
    @Binding var contacts: [CNContact]
    
    
    var body: some View {
        HStack{
            Image("Logo")
                .resizable()
                .frame(width: 140, height: 20)
            Spacer()
            HStack{
                Button(action: {
                    print("button pushed")
                    showSearchModal = true
                }, label: {
                    Image("Search")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
                .sheet(isPresented: self.$showSearchModal, content: {
                    SearchView(contacts: $contacts)
                })
                Button(action: {
                    print("button {ushed")
                    showPlusModal = true
                }, label: {
                    Image("Plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(22)
                })
                .sheet(isPresented: self.$showPlusModal, content: {
                    PlusView()
                })
                Button(action: {
                    print("button {ushed")
                    showSettingModal = true
                }, label: {
                    Image("Setting")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
                .sheet(isPresented: self.$showSettingModal, content: {
                    SettingView()
                })
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxHeight: 44)
    }
}


