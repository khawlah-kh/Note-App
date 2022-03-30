//
//  DummyData.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import Foundation



struct Note :Hashable,Codable{
    let _id :String
    var title : String
    var date : String
    var note : String
      
}

let notes :[Note] = [.init(_id: "1", title: "note1", date: "28 Mar", note: "My first note"),
                     .init(_id: "2", title: "note2", date: "28 Mar", note: "My second note"),
                     .init(_id: "3", title: "note3", date: "28 Mar", note: "My third note")]
