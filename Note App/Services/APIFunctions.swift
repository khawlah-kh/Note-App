//
//  APIFunctions.swift
//  Note App
//
//  Created by khawlah khalid on 28/03/2022.
//

import Foundation
import Alamofire

class APIFunctions{
    static let shared = APIFunctions()
    typealias completion = ([Note])->()
    func fetchNotes(completion:@escaping completion){
        var notes :[Note] = []
        
        AF.request("http://192.168.100.32:8081/fetch").response{ response in
            
            let decoder = JSONDecoder()
            if let data = response.data {
                do{
                    notes = try decoder.decode([Note].self, from: data)
                }
                catch{
                    print("Decoding Error")
                }
                completion(notes)
            }
        }
    }
    
    
    func addNote(title:String,note:String,completion:@escaping completion){
        
        AF.request("http://192.168.100.32:8081/create",method: .post,encoding: URLEncoding.httpBody,headers: ["date":noteDate,"title":title,"note":note]).responseJSON { response  in
            self.fetchNotes { notes in
                completion(notes)
            }
        }
    }
    
    func updateNote(id:String,title:String,note:String,completion:@escaping completion){
        
        AF.request("http://192.168.100.32:8081/update",method: .post,encoding: URLEncoding.httpBody,headers: ["id":id,"date":noteDate,"title":title,"note":note]).responseJSON { response  in
            
            self.fetchNotes { notes in
                completion(notes)
            }
        }
    }
    
    func deleteNote(id:String,completion:@escaping completion){
        
        AF.request("http://192.168.100.32:8081/delete",method: .post,encoding: URLEncoding.httpBody,headers: ["id":id]).responseJSON { response  in
            
            self.fetchNotes { notes in
                completion(notes)
            }
        }
    }
    
    
    var noteDate : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())
        return date
    }
    
}
