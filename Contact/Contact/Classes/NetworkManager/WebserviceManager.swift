//
//  WebserviceManager.swift
//  Talocity
//
//  Created by Rahul Srivastava on 17/02/17.
//  Copyright © 2017 Talocity. All rights reserved.
//

import UIKit

class WebserviceManager: NSObject {
    
    var connectionManager:ConnectionManager?
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func callWebservice(completionHandler:@escaping (AnyObject?) -> Void) {
        if appDelegate.networkStatus != .notReachable {
            connectionManager = ConnectionManager()
            connectionManager!.callWebserviceSession(completionBlock: { (data, response, error) -> Void in
                if let responseData:Data = data {
                    let responseModelClass:AnyObject?
                    do {
                        let parsedArray:[Dictionary<String, AnyObject>] = try JSONSerialization.jsonObject(with: responseData, options: []) as! [Dictionary<String, AnyObject>]
                        responseModelClass = UsersModel(fromArray: parsedArray)
                        completionHandler(responseModelClass)
                    } catch {
                        completionHandler(nil)
                    }
                } else {
                    completionHandler(nil)
                }
            })
        } else {
            completionHandler(nil)
        }
    }
}
