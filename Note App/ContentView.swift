//
//  ContentView.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                List(notes,id:\.self){note in
                    Text(note.note)
                }
        Text("Hello, world!")
            .padding()
            
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
