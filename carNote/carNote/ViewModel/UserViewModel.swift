//
//  UserViewModel.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import Foundation
import Alamofire
class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    var email:String = ""
    var password:String = ""
    var first_name:String = ""
    var last_name:String = ""
    var cin:String = ""
    var role:String = ""
    var phone_number:String = ""
    var image:String = ""
    var emailToken:String = ""

    
    func LogIn(email: String,password: String) {
        let parametres: [String: Any] = [
            "username": email,
            "password": password
        ]
        AF.request("http://172.17.5.248:3000/api/user/login" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
        AF.request("http://172.17.5.248:3000/api/user/register" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
        AF.request("http://172.17.5.248:3000/api/user/verifyAccount" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
        AF.request("http://172.17.5.248:3000/api/user/forgotPassword" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    func UpdateUser(email: String) {
        let parametres: [String: Any] = [
            "first_name": first_name,
            "last_name": last_name,
            "cin":cin,
            "phone_number":phone_number,
            "role":role,
        ]
        AF.request("http://172.17.5.248:3000/api/user/update" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
