//
//  Conversation.swift
//  carNote
//
//  Created by Apple Esprit on 28/12/2022.
//

import Foundation



struct Conversation {
    
    internal init(_id: String? = nil, dernierMessage: String, dateDernierMessage: Date, envoyeur: User, recepteur: User) {
        self._id = _id
        self.dernierMessage = dernierMessage
        self.dateDernierMessage = dateDernierMessage
        self.envoyeur = envoyeur
        self.recepteur = recepteur
    }
    
    var _id : String?
    var dernierMessage : String
    var dateDernierMessage : Date
    
    // relations
    var envoyeur : User
    var recepteur : User
}
