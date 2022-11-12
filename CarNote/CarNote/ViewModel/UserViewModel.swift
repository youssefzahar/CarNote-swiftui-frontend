//
//  UserViewModel.swift
//  CarNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import Foundation
import Alamofire
class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    var email:String = ""
    var password:String = ""

    
    func LogIn(email: String,password: String) {
        let parametres: [String: Any] = [
            "email": email,
            "password": password
        ]
        AF.request("http://172.17.2.198:3000/api/user/login" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    func SignUp(user: User) {
        let parametres: [String: Any] = [
            "name": user.first_name,
            "lastName": user.last_name,
            "email": user.email,
            "password": user.password,
            "number": user.phone_number,
            
            
        ]
        AF.request("http://172.17.2.198:3000/api/user/register" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
        
    }

}
