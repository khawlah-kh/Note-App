//
//  Note_AppApp.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import SwiftUI

@main
struct Note_AppApp: App {
    @StateObject var noteViewModel = NoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(noteViewModel)
        }
    }
}
