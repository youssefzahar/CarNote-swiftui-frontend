//
//  UserViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import Foundation
import Alamofire
import  PhotosUI


class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    var email:String = ""
    var password:String = ""
    var first_name:String = ""
    var last_name:String = ""
    var cin:String = ""
    var role:String = ""
    var phone_number:String = ""
 
    var emailToken:String = ""
    var image:String=""
    static var currentUser: User?
    var url:String = "http://172.17.1.254:3000/api/user/"
   

    
    func LogIn(email: String,password: String , complited: @escaping(User?)-> Void) {
        let parametres: [String: Any] = [
            "username": email,
            "password": password
        ]
        AF.request(url+"login" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    let response = JSON as! NSDictionary
                    let userResponse = response.object(forKey: "user") as! NSDictionary
                    let email = userResponse .object(forKey: "email") as? String ?? ""
                    let  first_name = userResponse .object(forKey: "first_name") as? String ?? ""
                    let  last_name = userResponse .object(forKey: "last_name") as? String ?? ""
                    let  phone_number = userResponse .object(forKey: "phone_number") as? String ?? ""
                    let   cin = userResponse .object(forKey: "cin") as? Int ?? 0
                    let  password = userResponse.object(forKey: "password") as? String ?? ""
                    let  role = userResponse.object(forKey: "role") as? String ?? ""
                    let  emailToken = userResponse.object(forKey: "emailToken") as? String ?? ""
                    let  isVerified = userResponse.object(forKey: "isVerified") as? Bool ?? true
                    let  image = userResponse.object(forKey: "image") as? String ?? ""
                    let  createdAt = userResponse.object(forKey: "createdAt") as? String ?? ""
                    let  updatedAt = userResponse.object(forKey: "updatedAt") as? String ?? ""
                    let  _id = userResponse.object(forKey: "_id") as? String ?? ""

                    var currentUser = User(_id: _id, first_name: first_name, last_name: last_name, cin: cin, email: email, password: password, role: role, phone_number: phone_number, emailToken: emailToken, isVerified: true, image: image, createdAt : createdAt, updatedAt: updatedAt)
                    
                    print(currentUser)
                    Self.currentUser = currentUser




                    

                    
                    print("success \(JSON)")
                    complited(currentUser)
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        print("email : ",email)
        print("password",password)
            
    }
    
    func Register( first_name:String, last_name:String, cin:Int, email: String, password: String, phone_number:String, role:String,  image:String) {
        let parametres: [String: Any] = [
            "first_name": first_name,
            "last_name": last_name,
            "cin":cin,
            "email": email,
            "password":password,
            "phone_number":phone_number,
            "role":role,
            "image":image
        ]
        AF.request(url+"register" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    func VerifyAccount(emailToken: String) {
        let parametres: [String: Any] = [
            "token":emailToken
        ]
        AF.request(url+"verifyAccount" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    func ResetPassword(email: String) {
        let parametres: [String: Any] = [
            "username": email
        ]
        AF.request(url+"forgotPassword" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                    print("email : ",email)
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        

    }
    
    
    func DeleteUser(email: String) {
        let parametres: [String: Any] = [
            "userId": email
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
    
    
       func UpdateUser(email: String ,first_name:String, last_name:String, phone_number:String,image:String) {
        let parametres: [String: Any] = [
            "userId": email,
            "first_name": first_name,
            "last_name": last_name,
            "phone_number":phone_number,
            "image":image

       
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
    
    
    func ShowUser(email: String ,first_name:String, last_name:String, phone_number:String, image:String) {
     let parametres: [String: Any] = [
         "userId": email,
          ]
        
        

     AF.request(url+"show" , method: .get,parameters: parametres,encoding: JSONEncoding.default)
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
    
    
    
    

}
