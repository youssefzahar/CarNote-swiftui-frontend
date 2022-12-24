//
//  Car.swift
//  carNote
//
//  Created by youssef-mariem on 21/11/2022.
//

import Foundation

struct Car : Identifiable, Hashable  {
    
    internal init(_id: String? = nil,modele: String? = nil,type:String? = nil,marque: String? = nil,immatricule: String ,puissance: Int? = nil, carburant:String? = nil, description: String? = nil,owned_by:String? = nil,attribute: String? = nil, image:String? = nil){
         
        self._id=_id
       self.modele=modele
       self.type=type
       self.marque=marque
       self.immatricule=immatricule
       self.puissance=puissance
       self.carburant = carburant
       self.description = description
       self.owned_by=owned_by
       self.attribute=attribute
       self.image=image
        //self.kilometrage=kilometrage


         
     }
    var _id: String?
    var modele: String?
    var type: String?
    var marque: String?
    var immatricule: String
    var puissance: Int?
    var carburant: String?
    var description: String?
    var owned_by: String?
    var attribute: String?
    var image: String?
    var id: String { immatricule }


}

var  carList = [Car ( marque : "ford",immatricule :"P1" , description : "NV" ,image : "logo"),
                Car ( marque : "ford",immatricule :"P1" , description : "NV" ,image : "logo"),
                Car ( marque : "ford",immatricule :"P1" , description : "NV" ,image : "logo")]
