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
    
    
    
    
    var url:String = "http://172.17.1.91:3000/api/entretien/"
    
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
    
    
  /*  func makeItem (jsonItem: JSON) -> Product{
        return Product (
            _id: jsonItem["_id"].stringValue,
            title: jsonItem["title"].stringValue,
            description: jsonItem["description"].stringValue,
            date: jsonItem["date"].DateFormatter.string(from: date)
            
        )
    }
*/
    
    
}
