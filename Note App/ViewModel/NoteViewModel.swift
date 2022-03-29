//
//  NoteViewModel.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import Foundation


class NoteViewModel : ObservableObject{
    
    @Published var notes : [Note] = []
    let apiFunctions = APIFunctions.shared
    init(){
        apiFunctions.fetchNotes { notes in
            DispatchQueue.main.async {
                self.notes=notes
            }

        }

    }
    
    
    
}
