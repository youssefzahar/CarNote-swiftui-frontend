//
//  Favorie.swift
//  carNote
//
//  Created by Apple Esprit on 30/12/2022.
//

import Foundation

struct Favorie : Identifiable  {
    
    internal init(_id: String , usr: String  ,car:String){
         
        self._id=_id
        self.usr = usr
       self.car=car


     }
    
    var _id: String
    var usr : String
    var car: String
    var id: String { _id }



}
