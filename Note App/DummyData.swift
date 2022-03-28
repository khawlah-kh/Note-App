//
//  DummyData.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import Foundation



struct Note : Identifiable,Hashable{
    let id = UUID()
    var title : String
    var date : String
    var note : String
      
}

let notes :[Note] = [.init(title: "note1", date: "28 Mar", note: "My first note"),
                     .init(title: "note1", date: "28 Mar", note: "My first note"),
                     .init(title: "note1", date: "28 Mar", note: "My first note")]
