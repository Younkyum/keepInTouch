//
//  ContentView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        let contacts: [ContactItem] = [
            ContactItem(image: "Setting", name: "Younkyum JIN", company: "Team Shaka"),
            ContactItem(image: "ProfileImage", name: "Maria DB", company: "")
        ]
        
        NavigationStack{
            VStack(alignment: .leading, content: {
                TitleBarView()
                    .background(.backgroundWhite)
                List(contacts) { contact in
                    ContactCellView(userImage: contact.image, contactName: contact.name, contactCompanyName:contact.company)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                
            })
            .background(.backgroundWhite)
        }
    }
}

#Preview {
    ContentView()
}


struct ContactCellView: View {
    @State private var showDetailModal = false
    @State public var userImage: String
    @State public var contactName: String
    @State public var contactCompanyName: String
    
    var body: some View {
        HStack{
            Image(userImage)
                .resizable()
                .frame(width: 58 , height: 58)
                .cornerRadius(29)
            VStack(alignment: .leading, spacing: 4, content: {
                Text(contactName)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.textBlack)
                
                Text(contactCompanyName)
                    .font(.system(size: 16))
                    .foregroundStyle(.textGray)
                
            })
            Spacer()
        }
        .onTapGesture {
            showDetailModal = true
        }
        .background(.backgroundWhite)
        .listRowSeparator(.hidden)
        .sheet(isPresented: self.$showDetailModal, content: {
            ContactDetailView()
        })
    }
}



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
