//
//  TextArea.swift
//  Twitter
//
//  Created by khawlah khalid on 24/09/2021.
//

import SwiftUI

struct TextArea: View {
    @Binding var note : String
    
    var  placeholder : String {
        if note.isEmpty{
            return "Type something . . ."
        }
        return ""
    }
    
    init(note:Binding<String>){
        self._note=note
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment:.topLeading){
            Text("\(placeholder)")
                .foregroundColor(Color(.placeholderText))
                .padding(.horizontal,5)
                .padding(.vertical,8)
            
            TextEditor(text: $note)
            
        }
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(note: .constant(""))
    }
}
