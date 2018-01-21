//
//  Company.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Company: NSObject {
    var bs : String!
    var catchPhrase : String!
    var name : String!
    
    init(fromDictionary dictionary: Dictionary<String, AnyObject>) {
        bs = dictionary["bs"] as? String
        catchPhrase = dictionary["catchPhrase"] as? String
        name = dictionary["name"] as? String
    }
}
