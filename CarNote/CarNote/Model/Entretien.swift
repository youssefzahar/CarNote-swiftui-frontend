//
//  Entretien.swift
//  carNote
//
//  Created by youssef-mariem on 13/12/2022.
//

import Foundation

struct Entretien : Identifiable  {
    
    internal init(_id: String? = nil, title: String  ,description:String? = nil ,date:Date? = nil){
         
        self._id=_id
        self.title = title
       self.description=description
       self.date=date
     }
    
    var _id: String?
    var title : String
    var description: String?
    var date: Date?
    var id: String { title }


}
