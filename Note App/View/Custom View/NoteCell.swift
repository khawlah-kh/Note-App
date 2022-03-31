//
//  NoteCellView.swift
//  Note App
//
//  Created by khawlah khalid on 30/03/2022.
//

import SwiftUI

struct NoteCell: View {
    let note : Note
    var body: some View {
        
        VStack(alignment: .leading, spacing:4){
            Text(note.title)
                .font(.title2)
                .bold()
            Text(note.note)
                .font(.title3)
                .lineLimit(1)
            Text(note.timestampString)
                .foregroundColor(.gray)
        }
    }
}

struct NoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        NoteCell(note: Note(_id: "", title: "Test", date: "12-Mar", note: "Test Nore"))
    }
}
