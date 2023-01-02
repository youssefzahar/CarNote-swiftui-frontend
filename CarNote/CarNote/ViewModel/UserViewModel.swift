//
//  UserViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import Foundation
import Alamofire
import  PhotosUI
import SwiftyJSON



class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    var email:String = ""
    var password:String = ""
    var first_name:String = ""
    var last_name:String = ""
    var user_name:String = ""
    var role:String = ""
    var phone_number:String = ""
    var _id:String = ""
    var emailToken:String = ""
    var image:String=""
    var confirmedPassword:String=""
    static var currentUser: User?
    var url:String = "http://172.17.0.156:3000/api/user/"
   

    
    func LogIn(user_name: String,password: String , complited: @escaping(User?)-> Void) {
        let parametres: [String: Any] = [
            "username": user_name,
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
                    let   user_name = userResponse .object(forKey: "user_name") as? String ?? ""
                    let  password = userResponse.object(forKey: "password") as? String ?? ""
                    let  role = userResponse.object(forKey: "role") as? String ?? ""
                    let  emailToken = userResponse.object(forKey: "emailToken") as? String ?? ""
                    let  isVerified = userResponse.object(forKey: "isVerified") as? Bool ?? true
                    let  image = userResponse.object(forKey: "image") as? String ?? ""
                    let  createdAt = userResponse.object(forKey: "createdAt") as? String ?? ""
                    let  updatedAt = userResponse.object(forKey: "updatedAt") as? String ?? ""
                    let  _id = userResponse.object(forKey: "_id") as? String ?? ""

                    var currentUser = User(_id: _id, first_name: first_name, last_name: last_name, user_name: user_name, email: email, password: password, role: role, phone_number: phone_number, emailToken: emailToken, isVerified: true, image: image, createdAt : createdAt, updatedAt: updatedAt)
                    
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
    
    func Register( first_name:String, last_name:String, user_name:String, email: String, password: String, phone_number:String, role:String) {
        let parametres: [String: Any] = [
            "first_name": first_name,
            "last_name": last_name,
            "user_name":user_name,
            "email": email,
            "password":password,
            "phone_number":phone_number,
            "role":role,
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
    
    func ChangePassword(_id: String ,password: String, confirmedPassword:String) {
        let parametres: [String: Any] = [
            "userID":_id,
            "newPassword":password,
            "confirmedpassword":confirmedPassword,
        ]
        AF.request(url+"changePassword" , method: .patch ,parameters: parametres,encoding: JSONEncoding.default)
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
            "code":emailToken
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
    
    
    func UpdateUser(_id:String ,email: String, phone_number:String) {
        let parametres: [String: Any] = [
            "userID": _id,
            "email": email,
            "phone_number":phone_number,
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
    
    
    
    
    
    func makeItem (jsonItem: JSON) -> User
    {
        return User (
            _id: jsonItem["_id"].stringValue,
            first_name: jsonItem["first_name"].stringValue,
            last_name: jsonItem["last_name"].stringValue,
            user_name: jsonItem["user_name"].stringValue,
            email: jsonItem["email"].stringValue,
            password: jsonItem["password"].stringValue,
            role: jsonItem["role"].stringValue,
            phone_number: jsonItem["phone_number"].stringValue,
            emailToken: jsonItem["emailToken"].stringValue,
            isVerified: jsonItem["isVerified"].boolValue,
            image: jsonItem["image"].stringValue,
            createdAt: jsonItem["createdAt"].stringValue,

            updatedAt: jsonItem["updatedAt"].stringValue
           
            
            
        )
    }
    
    
    

}
