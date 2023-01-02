//
//  Entretien.swift
//  carNote
//
//  Created by youssef-mariem on 13/12/2022.
//

import Foundation

struct Entretien : Identifiable  {
    
    internal init(_id: String? = nil, title: String  ,description:String? = nil ,date:Date? = nil, owned_by: String? = nil){
         
        self._id=_id
        self.title = title
       self.description=description
       self.date=date
        self.owned_by=owned_by

     }
    
    var _id: String?
    var title : String
    var description: String?
    var date: Date?
    var id: String { title }
    var owned_by: String?



}

var  entretienList = [Entretien (title :"P1" , description : "desc 1" ,date : Date.now ),
                      Entretien (title :"P2" , description : "desc 2" ,date : Date.now ),
                      Entretien (title :"P3" , description : "desc 3" ,date : Date.now )]

