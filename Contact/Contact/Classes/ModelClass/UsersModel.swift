//
//  UsersModel.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class UsersModel: NSObject {
    var contacts:[Contact]
    
    init(fromArray array: [Dictionary<String, AnyObject>]) {
        contacts = [Contact]()
        for dic in array {
            let value = Contact(fromDictionary: dic)
            contacts.append(value)
        }
    }
}
