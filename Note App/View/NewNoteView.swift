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
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : NoteViewModel
    
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
                .font(.bold(.title)())
                .padding(.horizontal)
                .padding(.top)
            
            TextArea(note: $noteText)
                .frame(width: UIScreen.main.bounds.width-24, height: UIScreen.main.bounds.height/2)
            Spacer()
        }.navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        if let _ = note {
                            Button {
                                handelDelete()
                            }
                        label: {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        }
                        Button {
                            handelSave()
                        } label: {
                            Text("Save")
                            
                        }
                        
                    }
                }
            }
    }
    
    func handelSave(){
        guard noteTitle != "" || noteText != "" else {
            if note != nil {
//                APIFunctions.shared.deleteNote(id:note!._id) { notes in
//                    viewModel.notes = notes
//                }
                
                APIFunctions.shared.deleteNoteUsingURLSession(id:note!._id) { notes in
                    viewModel.notes = notes
                }
            }
            presentationMode.wrappedValue.dismiss()
            return
        }
        if let note = note {
//            APIFunctions.shared.updateNote(id: note._id, title:noteTitle, note: noteText){notes in
//                viewModel.notes = notes
//            }
            APIFunctions.shared.updateNoteUsingURLSession(id: note._id, title:noteTitle, note: noteText){notes in
                viewModel.notes = notes
            }
        }
        
        else{
            
//            APIFunctions.shared.addNote( title: noteTitle, note: noteText){notes in
//                viewModel.notes = notes
//            }
            APIFunctions.shared.addNoteUsingURLSession( title: noteTitle, note: noteText){notes in
                viewModel.notes = notes
            }
            
        }
        
        presentationMode.wrappedValue.dismiss()
        
        
    }
    func handelDelete(){
//        APIFunctions.shared.deleteNote(id:note!._id) { notes in
//            viewModel.notes = notes
//        }
        APIFunctions.shared.deleteNoteUsingURLSession(id:note!._id) { notes in
            viewModel.notes = notes
        }

        presentationMode.wrappedValue.dismiss()
    }
}
struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewNoteView()
        }
    }
}
