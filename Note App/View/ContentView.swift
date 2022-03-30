//
//  ContentView.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : NoteViewModel
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.notes,id:\.self){note in
                    NavigationLink {
                        NewNoteView(note:note)
                    } label: {
                        NoteCell(note: note)
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                 
                    NavigationLink("Add Note") {
                        NewNoteView()
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
