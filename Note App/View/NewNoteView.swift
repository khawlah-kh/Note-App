//
//  NewNoteView.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import SwiftUI

struct NewNoteView: View {
    var note : Note?
    @State var noteTitle : String = ""
    @State var noteText : String = ""
    var navigationTitle = "Add Note"
    
    init(note:Note? = nil){
        if let note = note {
            _noteTitle = State(initialValue:note.title)
            _noteText = State(initialValue:note.note)
            navigationTitle = "Edit Note"
            self.note = note
        }
        
    }
    var body: some View {
        VStack{
        TextField("Note Title", text:$noteTitle)
                .padding()
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextArea(note: $noteText)
                .frame(width: UIScreen.main.bounds.width-24, height: UIScreen.main.bounds.height/2)
               
                .border(Color.secondary.opacity(0.3), width: 1)
            Spacer()
        }.navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        Button {
                            
                            if let note = note {
                                print("update note")
                                print("💜")
                            }

                            else{
                                print(note)
                            APIFunctions.shared.addNote(date: Date().description, title: noteTitle, note: noteText)
                                print("🤍")
                            }
                        } label: {
                            Text("Save")
                              
                        }

                }
            }
    }
}
}
struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewNoteView()
        }
    }
}
