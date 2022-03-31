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
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: getDateFromString(isoDate: date), to: Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a · MM/dd/yyyy"
        return formatter.string(from: getDateFromString(isoDate: date))
    }
    func getDateFromString(isoDate:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)!
        return date
    }
}

let notes :[Note] = [.init(_id: "1", title: "note1", date: "28 Mar", note: "My first note"),
                     .init(_id: "2", title: "note2", date: "28 Mar", note: "My second note"),
                     .init(_id: "3", title: "note3", date: "28 Mar", note: "My third note")]
