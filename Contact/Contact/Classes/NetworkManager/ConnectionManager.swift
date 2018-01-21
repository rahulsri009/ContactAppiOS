//
//  ConnectionManager.swift
//  Talocity
//
//  Created by Rahul Srivastava on 17/02/17.
//  Copyright © 2017 Talocity. All rights reserved.
//

import UIKit

class ConnectionManager: NSObject {
    
    let contactWebserviceString: String = "https://jsonplaceholder.typicode.com/users"
    
    func callWebserviceSession(completionBlock: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let url:URL = URL(string: contactWebserviceString) {
            let session = URLSession.shared
            let request:URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
            let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                completionBlock(data, response, error)
            })
            task.resume()
        } else {
            completionBlock(nil, nil, nil)
        }
    }
}
