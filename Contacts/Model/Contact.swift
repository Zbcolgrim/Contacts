//
//  Contact.swift
//  Contacts
//
//  Created by Zachary Buffington on 9/10/21.
//

import Foundation
class Contact: Codable {
    var name: String
    var email: String
    var phone: Int
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}

extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.name == rhs.name &&
            lhs.email == lhs.email &&
            lhs.phone == rhs.phone 
    }
    
    
}
