//
//  Product.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import Foundation

struct Product : Identifiable, Codable {
    

    internal init(_id: String? = nil,title: String ,stock: Int? = nil,prix: Int? = nil,description: String? = nil,image: String? = nil){
         
         self._id=_id
         self.title=title
         self.stock=stock
         self.prix=prix
         self.description=description
     
         self.image=image
         
     }
    
    var _id: String?
    var title: String
    var stock: Int?
    var prix: Int?
    var description: String?
    //var owned_by: String?
    var image: String?
    var id: String { title }
    
  
    
}
    
    var  productList = [Product (title :"P1" , prix : 10 ,image : "logo" ),
                        Product (title :"P2" , prix : 10 ,image : "logo" ),
                        Product (title :"P3" , prix : 12,image : "logo" )]
    
    
