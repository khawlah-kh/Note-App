//
//  AddUpdateNoteViewModel.swift
//  Note App
//
//  Created by khawlah khalid on 30/03/2022.
//

import SwiftUI


class AddUpdateNoteViewModel : ObservableObject{
    
    var note : Note?
    @Published var noteTitle : String = ""
    @Published var noteText : String = ""
    var navigationTitle = "Add Note"
    init(note:Note? = nil){
        if let note = note {
            _noteTitle = Published(initialValue:note.title)
            _noteText = Published(initialValue:note.note)
            navigationTitle = "Edit Note"
            self.note = note
        }
        
    }
    
    var shouldShowDeleteButton : Bool{
        note != nil
    }
    
    func handelDelete(){
        APIFunctions.shared.deleteNote(id:note!._id) { notes in
    }
//    func handelSave(){
//        if let note = note {
//            APIFunctions.shared.updateNote(id: note._id, title:noteTitle, note: noteText){notes in
//                viewModel.notes = notes
//                
//            }
//        }
//        
//        else{
//            
//            APIFunctions.shared.addNote( title: noteTitle, note: noteText){notes in
//                
//                viewModel.notes = notes
//            }
//        }

        
        
    }
    
    
    
    
}

