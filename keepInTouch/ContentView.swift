//
//  ContentView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, content: {
                TitleBarView()
                List {
                    CustomHeaderCellView()
                    CustomCellView()
                    CustomCellView()
                    CustomCellView()
                    CustomCellView()
                    CustomCellView()
                    CustomHeaderCellView()
                    CustomCellView()
                    CustomCellView()
                    CustomCellView()
                    
                }
                .listStyle(.plain)
                
            }
            )}
    }
}

#Preview {
    ContentView()
}


struct CustomCellView: View {
    var body: some View {
        HStack{
            Image("ProfileImage")
                .resizable()
                .frame(width: 58 , height: 58)
                .cornerRadius(29)
            VStack(alignment: .leading, spacing: 5, content: {
                Text("Younkyum Jin")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text("Team Shaka")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            })
            
        }
        .listRowSeparator(.hidden)
    }
}


struct CustomHeaderCellView: View {
    var body: some View {
        HStack{
            Text("헤더입니다.")
                .font(.system(size: 14))
                .fontWeight(.light)
                .foregroundStyle(.gray)
        }
        .frame(maxHeight: 35)
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
