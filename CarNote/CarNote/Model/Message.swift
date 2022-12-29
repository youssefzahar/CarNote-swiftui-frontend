//
//  Message.swift
//  carNote
//
//  Created by Apple Esprit on 28/12/2022.
//

import Foundation

import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message : MessageType {
    
   // var kind: MessageKit.MessageKind
    
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
