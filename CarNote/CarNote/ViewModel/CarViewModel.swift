//
//  CarViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 22/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarViewModel : ObservableObject{
    
    static let sharedInstance = CarViewModel()
    @Published var ListCars = [Car] ()
    
    
    
    var _id: String = ""
    var modele: String = ""
    var type: String = ""
    var marque: String = ""
    var immatricule: String = ""
    var puissance: Int = 0
    var carburant: String = ""
    var description: String = ""
    var owned_by: String = ""
    var attribute: String = ""
    var image: String = ""
    var kilometrage : Int = 0
    
    var url:String = "http://172.17.2.129:3000/api/car/"
    
    
    func DeleteCar(_id: String) {
        let parametres: [String: Any] = [
            "carID": _id
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
    
    
    func AddCar( modele:String, type:String, marque:String, immatricule: String,  puissance: Int, carburant:String, description:String, owned_by: String ) {
        let parametres: [String: Any] = [
            "modele": modele,
            "type":type,
            "marque": marque,
            "immatricule": immatricule,
           "puissance": puissance,
            "carburant": carburant,
           "description": description,
            "owned_by": owned_by,
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
    
    
    
    
    func GetCars(completed: @escaping (Bool,[Car]?) -> Void ){
        
        
        AF.request(url+"userCars/"+UserViewModel.currentUser!._id ?? "", method: .get)
            .validate(statusCode: 200..<300)
           // .validate(contentType: ["application/json"] )
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var cars : [Car]? = []
                    for singleJsonItem in json["response"]{
                        cars!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(cars)
                    completed(true,cars)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }

    
    func GetPublicCars(completed: @escaping (Bool,[Car]?) -> Void ){
        
        
        AF.request(url+"showMarketplace", method: .get)
            .validate(statusCode: 200..<300)
           // .validate(contentType: ["application/json"] )
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var cars : [Car]? = []
                    for singleJsonItem in json["response"]{
                        cars!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(cars)
                    completed(true,cars)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }

    
    
    
    
    
   
    func makeItem (jsonItem: JSON) -> Car{
        return Car (
            _id: jsonItem["_id"].stringValue,
            modele: jsonItem["modele"].stringValue,
            type: jsonItem["type"].stringValue,
            marque: jsonItem["marque"].stringValue,
            immatricule: jsonItem["immatricule"].stringValue,
            puissance: jsonItem["puissance"].intValue,
            carburant: jsonItem["carburant"].stringValue,
            description: jsonItem["description"].stringValue,
            owned_by: jsonItem["owned_by"].stringValue,
            attribute: jsonItem["attribute"].stringValue,
            image: jsonItem["image"].stringValue
           // kilometrage: jsonItem["kilometrage"].intValue


            
            
        )
    }
    
  
    
    
    

    
    
    
    
    
    
    
}
