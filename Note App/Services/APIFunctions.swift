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
    //Using Alamofire
//    func fetchNotes(){
//        var notes :[Note] = []
//
//        AF.request("http://192.168.100.32:8081/fetch").response{ response in
//
//            let decoder = JSONDecoder()
//            if let data = response.data {
//                do{
//                    notes = try decoder.decode([Note].self, from: data)
//                }
//                catch{
//                    print("Decoding Error")
//                }
//
//            }
//
//
//        }
//
//
//
//    }
    
    //Using URLSession
    func fetchNotes(completion:@escaping([Note])->()){
            let url = URL(string: "http://192.168.100.32:8081/fetch")!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with:request) { data, response, error in
    
                if let data = data {
                    var notes :[Note] = []
                    let decoder = JSONDecoder()
                    do{
                         notes = try decoder.decode([Note].self, from: data)
    
                    }
                    catch{
                        print("Decoding Error")
                    }
                    
                    completion(notes)

    
                }
            }.resume()
    
        }
    
}
