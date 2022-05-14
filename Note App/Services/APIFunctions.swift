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
        
        AF.request("http://MyIPAddress/fetch").response{ response in
            
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
    
    
//    func addNote(title:String,note:String,completion:@escaping completion){
//        
//        AF.request("http://MyIPAddress/create",method: .post,encoding: URLEncoding.httpBody,headers: ["date":noteDate,"title":title,"note":note]).responseJSON { response  in
//            self.fetchNotes { notes in
//                completion(notes)
//            }
//        }
//    }
    
//    func updateNote(id:String,title:String,note:String,completion:@escaping completion){
//        
//        AF.request("http://MyIPAddress/update",method: .post,encoding: URLEncoding.httpBody,headers: ["id":id,"date":noteDate,"title":title,"note":note]).responseJSON { response  in
//            
//            self.fetchNotes { notes in
//                completion(notes)
//            }
//        }
//    }
    
//    func deleteNote(id:String,completion:@escaping completion){
//
//        AF.request("http://MyIPAddress/delete",method: .post,encoding: URLEncoding.httpBody,headers: ["id":id]).responseJSON { response  in
//
//            self.fetchNotes { notes in
//                completion(notes)
//            }
//        }
//    }
     
    
    var noteDate : String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.string(from: Date())
        return date
    }
    
    
    
    
    //MARK: Using URLSession
    func addNoteUsingURLSession(title:String,note:String,completion:@escaping completion){
        let url = URL(string: "http://MyIPAddress/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["date":noteDate,"title":title,"note":note]
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("No response or error")
                return
            }
            self.fetchNotes { notes in
                completion(notes)
            }

        }.resume()

        
        
    }
    
    
    func updateNoteUsingURLSession(id:String,title:String,note:String,completion:@escaping completion){
    
    let url = URL(string: "http://MyIPAddress/update")!
    var request = URLRequest(url: url)
    request.httpMethod="Post"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.allHTTPHeaderFields = ["id":id,"date":noteDate,"title":title,"note":note]
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("No response or error")
            return
        }
        self.fetchNotes { notes in
            completion(notes)
        }

    }.resume()
}
    
    
    func deleteNoteUsingURLSession(id:String,completion:@escaping completion){
        
        let url = URL(string: "http://MyIPAddress/delete")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["id":id]
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("No response or error")
                return
            }
            self.fetchNotes { notes in
                completion(notes)
            }

        }.resume()
    }
    
    
}
