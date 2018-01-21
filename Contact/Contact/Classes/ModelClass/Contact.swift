//
//  Contact.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var address : Address!
    var company : Company!
    var email : String!
    var id : Int!
    var name : String!
    var phone : String!
    var username : String!
    var website : String!
    
    init(fromDictionary dictionary: Dictionary<String, AnyObject>) {
        if let addressData = dictionary["address"] as? Dictionary<String, AnyObject> {
            address = Address(fromDictionary: addressData)
        }
        if let companyData = dictionary["company"] as? Dictionary<String, AnyObject> {
            company = Company(fromDictionary: companyData)
        }
        email = dictionary["email"] as? String
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        phone = dictionary["phone"] as? String
        username = dictionary["username"] as? String
        website = dictionary["website"] as? String
    }
}
