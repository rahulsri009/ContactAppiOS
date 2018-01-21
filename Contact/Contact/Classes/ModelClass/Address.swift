//
//  Address.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Address: NSObject {
    var city : String!
    var geo : Geo!
    var street : String!
    var suite : String!
    var zipcode : String!
    
    init(fromDictionary dictionary: Dictionary<String, AnyObject>) {
        city = dictionary["city"] as? String
        if let geoData = dictionary["geo"] as? Dictionary<String, AnyObject> {
            geo = Geo(fromDictionary: geoData)
        }
        street = dictionary["street"] as? String
        suite = dictionary["suite"] as? String
        zipcode = dictionary["zipcode"] as? String
    }
}
