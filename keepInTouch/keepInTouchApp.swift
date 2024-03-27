//
//  keepInTouchApp.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI
import SwiftData

@main
struct keepInTouchApp: App {
    
//    var modelContainer: ModelContainer = {
//        let schema = Schema([NotiContacts.self, RegiNotification.self, CurrNotification.self])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could Not Create ModelContainer: \(error)")
//        }
//    }()
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                //.modelContainer(modelContainer)
        }
    }
}
