//
//  NewNoteView.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import SwiftUI

struct NewNoteView: View {
    @State var noteTitle : String = ""
    @State var note : String = ""
    var body: some View {
        VStack{
        TextField("Note Title", text:$noteTitle)
                .padding()
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextArea(note: $note)
                .frame(width: UIScreen.main.bounds.width-24, height: UIScreen.main.bounds.height/2)
               
                .border(Color.secondary, width: 1)
            Spacer()
        }.navigationTitle("Add Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        Button {
                            
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
