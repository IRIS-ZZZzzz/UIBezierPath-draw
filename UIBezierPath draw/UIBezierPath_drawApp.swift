//
//  UIBezierPath_drawApp.swift
//  UIBezierPath draw
//
//  Created by 鍾瑀璇 on 2022/4/30.
//

import SwiftUI

@main
struct UIBezierPath_drawApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
