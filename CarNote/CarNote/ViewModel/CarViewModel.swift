//
//  CarViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 22/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class CarViewModel : ObservableObject{
    
    static let sharedInstance = CarViewModel()
    @Published var ListCars = [Car] ()
   // @Published car : Car
    
    
    
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
    @Published var image: UIImage = UIImage.init(named: "empty") ?? UIImage()
    var kilometrage : Int = 0
    @Published var showFileUpload = false
    
    var url:String = "http://172.17.2.220:3000/api/car/"
    
    
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
    
    
    func MakeCarPublic(_id: String) {
        let parametres: [String: Any] = [
            "carID": _id
        ]
        AF.request(url+"makePublic" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    
    func AddCar( modele:String, type:String, marque:String, immatricule: String,  puissance: Int, carburant:String, description:String, owned_by: String, image: UIImage  ) {
        let parametres: [String: Any] = [
            "modele": modele,
            "type":type,
            "marque": marque,
            "immatricule": immatricule,
            "puissance": String( puissance),
            "carburant": carburant,
           "description": description,
            "owned_by": owned_by,
        ]
        
        let imgData = image.jpegData(compressionQuality: 0.2)!
        AF.upload(multipartFormData: { multipartFormData in
                   multipartFormData.append(imgData, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
                   for ( key,value) in parametres {
                       
                       multipartFormData.append(  (value as! String).data(using: .utf8)!, withName: key)
                   } //Optional for extra parameters
               },
                         to:url+"add").responseData(completionHandler: { response in
                   switch response.result {
                   case .success:
                       
                       print("success image")
                       
                   case .failure(let encodingError):
                       print(encodingError)
                   }
               })
            
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
/*  func AddCar( car : Car, image:UIImage, completed: @escaping (Bool,Int) -> Void ) {
      let token = UserDefaults.standard.string(forKey: "token")
      let headers : HTTPHeaders = [.authorization(bearerToken: token!),.content("multipart/form-data")]
      AF.upload(
          multipartFormData: { multipartFormData in
              multipartFormData.append(image.jpegData(compressionQuality: 0.5)! ; withName : "image", fileName: "image.jpg",minetype:"image/jpg")
              multipartFormData.append(car.modele.data(using: String.Encoding.utf8)!; withName: "modele")
              multipartFormData.append(car.type.data(using: String.Encoding.utf8)!; withName: "type")
              multipartFormData.append(car.marque.data(using: String.Encoding.utf8)!; withName: "marque")
              multipartFormData.append(car.immatricule.data(using: String.Encoding.utf8)!; withName: "immatricule")
              multipartFormData.append(car.puissance.description.data(using: String.Encoding.utf8)!; withName: "puissance")
              multipartFormData.append(car.carburant.data(using: String.Encoding.utf8)!; withName: "carburant")
              multipartFormData.append(car.description.data(using: String.Encoding.utf8)!; withName: "description")
              multipartFormData.append(car.owned_by.data(using: String.Encoding.utf8)!; withName: "owned_by")
              for field in car.fields{
                  multipartFormData.append(field.rawValue.data(using: String.Encoding.utf8)!; withName: "fields")
              }
          },to: url+"add",method: .post, headers: headers)
      .validate(statusCode: 200..<300)
      .responseData {
          (response) in
          switch response.result {
          case .success(let JSON):
              print("success \(JSON)")
          case .failure(let error):
              print("request failed \(error)")
          }
      }
      )*/
