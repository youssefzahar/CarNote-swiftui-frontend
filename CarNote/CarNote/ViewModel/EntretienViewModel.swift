//
//  EntretienViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 13/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


public class EntretienViewModel : ObservableObject {
    static let sharedInstance = EntretienViewModel()
    @Published var ListEntretiens = [Entretien] ()
    
    var _id: String = ""
    var title : String = ""
    var description: String = ""
    var date: Date = Date()
    var owned_by: String = ""
    
    
    
    
    var url:String = "http://172.17.1.24:3000/api/entretien/"
    
    /*  init() {
     
     GetProducts(completed: {(success ,reponse) in
     if success {
     let ListProducts = reponse!
     }else {
     print("ERROR")
     }
     })
     
     
     }*/
    
    func AddEntretien( title:String, description:String, date:Date, owned_by: String) {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let parametres: [String: Any] = [
            "title": title,
            "description": description ,
            "date" : dateFormatter.string(from : date),
            "owned_by": owned_by
            
        ]
        AF.request(url+"add" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        
    }
    
    
    
    
    func GetMyEntretiens(completed: @escaping (Bool,[Entretien]?) -> Void){
        AF.request(url+"usersEntretien/"+UserViewModel.currentUser!._id ?? "", method: .get)
            .validate(statusCode: 200..<300)
           // .validate(contentType: ["application/json"] )
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var entretiens : [Entretien]? = []
                    for singleJsonItem in json["response"]{
                        entretiens!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(entretiens)
                    completed(true,entretiens)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }
    
    func DeleteEntretien(_id: String) {
        let parametres: [String: Any] = [
            "entretientID": _id
        ]
        AF.request(url+"delete" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        

    }
    
    func makeItem (jsonItem: JSON) -> Entretien{
        return Entretien (
            _id: jsonItem["_id"].stringValue,
            title: jsonItem["title"].stringValue,
            description: jsonItem["description"].stringValue,
           // date: jsonItem["date"].encode(to: Date(from: date as! Decoder))
           // date:DateUtils.formatFromString(string: jsonItem["date"].stringValue),
            date:DateUtils.formatFromString(string: jsonItem["date"].stringValue)
         )
        
    }

    
    
    
}
