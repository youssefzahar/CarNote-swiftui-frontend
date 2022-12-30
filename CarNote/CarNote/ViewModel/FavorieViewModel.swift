//
//  FavorieViewModel.swift
//  carNote
//
//  Created by Apple Esprit on 30/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


public class FavorieViewModel : ObservableObject {
    static let sharedInstance = FavorieViewModel()
    @Published var ListFavorie = [Favorie] ()
    
    var _id: String = ""
    var car : String = ""
    var usr: String = ""
    
    
    
    
    var url:String = "http://172.17.1.75:3000/api/favorie/"

    
    func AddFavorie( usr:String, car:String) {

        let parametres: [String: Any] = [
            "usr": usr,
            "car": car ,
            
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
    
    
    
    
    func GetMyFavories(completed: @escaping (Bool,[Favorie]?) -> Void){
        AF.request(url+"usersFavorie/"+UserViewModel.currentUser!._id ?? "", method: .get)
            .validate(statusCode: 200..<300)
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var favories : [Favorie]? = []
                    for singleJsonItem in json["response"]{
                        favories!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(favories)
                    completed(true,favories)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }
    
    
    
    func makeItem (jsonItem: JSON) -> Favorie{
        return Favorie (
            _id: jsonItem["_id"].stringValue,
            usr: jsonItem["title"].stringValue,
            car: jsonItem["description"].stringValue
         )
        
    }

    
    
    
}
