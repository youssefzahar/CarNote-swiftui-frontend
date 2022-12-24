//
//  User.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import Foundation
// import  PhotosUI

struct User{
  
    var _id: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var user_name: String = ""
    var email: String = ""
    var password: String = ""
    var role: String = ""
    var phone_number: String = ""
    var  emailToken: String = ""
    var isVerified: Bool = true
    
    var image : String = ""
    var  createdAt: String = ""
    var  updatedAt: String = ""
    
   init(_id: String,first_name: String,last_name: String,user_name: String,email: String,password: String,role: String,phone_number: String,emailToken: String,isVerified: Bool,image: String,createdAt: String,updatedAt: String){
        self._id=_id
        self.first_name=first_name
        self.last_name=last_name
        self.user_name=user_name
        self.email=email
        self.password=password
        self.role=role
        self.phone_number=phone_number
        self.emailToken=emailToken
        self.isVerified=isVerified
        self.image=image
        self.createdAt=createdAt
        self.updatedAt=updatedAt
    }
    
    init(first_name: String,last_name: String,user_name: String,email: String,password: String,role: String,phone_number: String,emailToken: String,isVerified: Bool,image: String,createdAt: String,updatedAt: String){
       
         self.first_name=first_name
         self.last_name=last_name
         self.user_name=user_name
         self.email=email
         self.password=password
         self.role=role
         self.phone_number=phone_number
         self.emailToken=emailToken
         self.isVerified=isVerified
         self.image=image
         self.createdAt=createdAt
         self.updatedAt=updatedAt
     }
    
    
    
    
        
    
   
    
}
