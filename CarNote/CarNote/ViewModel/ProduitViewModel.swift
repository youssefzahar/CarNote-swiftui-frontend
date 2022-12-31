//
//  ProduitViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 26/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit




public class ProduitViewModel : ObservableObject{
    static let sharedInstance = ProduitViewModel()
    
    @Published var ListProducts = [Product] ()
    
    var _id: String = ""
    var title: String = ""
    var stock : Int = 0
    var prix: Int = 0
    var description: String = ""
    var owned_by: String = ""
    @Published var image: UIImage = UIImage.init(named: "empty") ?? UIImage()
    @Published var showFileUpload = false
    
    
    
    var url:String = "http://172.17.0.156:3000/api/product/"
    
 /*  init() {
        
        GetProducts(completed: {(success ,reponse) in
            if success {
                let ListProducts = reponse!
            }else {
                print("ERROR")
            }
        })
        
        
    }*/
    
    /*func AddProduct( title:String, stock:Int, prix:Int, description: String, owned_by: String) {
        let parametres: [String: Any] = [
            "title": title,
            "stock": stock ,
            "prix":prix,
            "description": description,
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
            
    }*/
    
    
    
    func AddProduct( title:String, stock:Int, prix:Int, description: String, owned_by: String, image: UIImage) {
        let parametres: [String: Any] = [
            "title": title,
            "stock": String(stock) ,
            "prix": String(prix),
            "description": description,
            "owned_by": owned_by
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
    
    
    func DeleteProduit(_id: String) {
        let parametres: [String: Any] = [
            "productID": _id
        ]
        AF.request(url+"delete" , method: .delete,parameters: parametres,encoding: JSONEncoding.default)
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
    
    
    func UpdateProduit( _id:String, stock:Int, prix:Int, description: String) {
     let parametres: [String: Any] = [
        "productID":_id,
        "stock": stock,
        "prix": prix,
        "description": description

          ]
     AF.request(url+"update" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    
    func GetProducts(completed: @escaping (Bool,[Product]?) -> Void){
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
           // .validate(contentType: ["application/json"] )
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var products : [Product]? = []
                    for singleJsonItem in json["response"]{
                        products!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(products)
                    completed(true,products)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }
    
    
    
    func GetMyProducts(completed: @escaping (Bool,[Product]?) -> Void){
        AF.request(url+"usersProducts/"+UserViewModel.currentUser!._id ?? "", method: .get)
            .validate(statusCode: 200..<300)
           // .validate(contentType: ["application/json"] )
            .responseData{ response in
                switch response.result {
                case.success(let data):
                    let json = JSON(data)
                    print(json)
                    var products : [Product]? = []
                    for singleJsonItem in json["response"]{
                        products!.append(self.makeItem(jsonItem: singleJsonItem.1))
                    
                    }
                    print(products)
                    completed(true,products)
                case let .failure(error):
                    debugPrint(error)
                   completed(false, nil)
                }
                
            }
    }
    
    
    
    

    
    
    func makeItem (jsonItem: JSON) -> Product{
        return Product (
            _id: jsonItem["_id"].stringValue,
            title: jsonItem["title"].stringValue,
            stock: jsonItem["stock"].intValue,
            prix: jsonItem["prix"].intValue,
            description: jsonItem["description"].stringValue,
            image: jsonItem["image"].stringValue,
            owned_by: jsonItem["owned_by"].stringValue

            
            
        )
    }
    
    
   
    
    
}
