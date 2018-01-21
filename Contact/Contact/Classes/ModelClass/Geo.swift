//
//  Geo.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Geo: NSObject {
    var lat : String!
    var lng : String!
    
    init(fromDictionary dictionary: Dictionary<String, AnyObject>) {
        lat = dictionary["lat"] as? String
        lng = dictionary["lng"] as? String
    }
}
