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
    var image:UIImage?
    var emailToken:String = ""

    var url:String = "http://172.17.0.166:3000/api/user/"

    
    func LogIn(email: String,password: String) {
        let parametres: [String: Any] = [
            "username": email,
            "password": password
        ]
        AF.request(url+"login" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        print("email : ",email)
        print("password",password)
            
    }
    
    func Register( first_name:String, last_name:String, cin:String, email: String, password: String, phone_number:String, role:String,  image:String) {
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
    
    
       func UpdateUser(email: String ,first_name:String, last_name:String, phone_number:String,image:UIImage) {
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
    
    
    func ShowUser(email: String ,first_name:String, last_name:String, phone_number:String, image:UIImage) {
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
