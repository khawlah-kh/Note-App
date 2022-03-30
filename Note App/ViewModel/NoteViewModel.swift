//
//  NoteViewModel.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import Foundation


class NoteViewModel : ObservableObject{
    
    @Published var notes : [Note] = [] {
        didSet{
            
         //  getNotesWithPreciseDate()
           
        }
    }
    let apiFunctions = APIFunctions.shared
    init(){
        apiFunctions.fetchNotes { notes in
            DispatchQueue.main.async {
                self.notes=notes
            }
        }
       
    }
    
//    func getNotesWithPreciseDate(){
//        for i in 0..<notes.count{
//            let date = getDate(stringDate: notes[i].date)
//            notes[i].date=timestampString(date: date)
//        }
//
//
//
//    }
  
    
    
//
//    func timestampString(date:Date)-> String {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
//        formatter.maximumUnitCount = 1
//        formatter.unitsStyle = .abbreviated
//        return formatter.string(from: date, to: Date()) ?? ""
//    }
    
//    func getDateFromString(stringDate:String) -> Date {
//        //let isoDate = "2016-04-14T10:44:00+0000"
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let date = dateFormatter.date(from:stringDate)!
//
//        return date
//    }
    
//    func getDate(stringDate:String) -> Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        dateFormatter.timeZone = TimeZone.current
//        dateFormatter.locale = Locale.current
//        return dateFormatter.date(from: "2015-04-01T11:42:00")! // replace Date String
//    }
}
