//
//  ContentView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI
import Contacts


struct ContentView: View {
    @State public var contacts = [CNContact]()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, content: {
                TitleBarView()
                    .background(.backgroundWhite)
                List(contacts, id: \.identifier) { contactDetail in
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
    ContentView()
}



// MARK: - CustomHeaderCellView
struct CustomHeaderCellView: View {
    var body: some View {
        HStack{
            Text("헤더입니다.")
                .font(.system(size: 14))
                .fontWeight(.light)
                .foregroundStyle(.gray)
            Spacer()
        }
        .frame(maxHeight: 35)
        .background(.backgroundWhite)
    }
}


// MARK: - TitleBarView
struct TitleBarView: View {
    @State private var showPlusModal = false
    @State private var showSettingModal = false
    
    var body: some View {
        HStack{
            Image("Logo")
                .resizable()
                .frame(width: 140, height: 20)
            Spacer()
            HStack{
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
