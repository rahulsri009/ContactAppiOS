//
//  MainNavigationViewController.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    
    var loadingIndicator:LoadingView!

    func showIndicator() {
        DispatchQueue.main.async { [weak self] in
            if let weakSelf = self {
                if (weakSelf.loadingIndicator != nil) {
                    weakSelf.loadingIndicator.stopIndicator()
                    weakSelf.loadingIndicator.removeFromSuperview()
                    weakSelf.loadingIndicator = nil
                }
                weakSelf.loadingIndicator = LoadingView(frame: weakSelf.view.frame)
                weakSelf.view.addSubview(weakSelf.loadingIndicator)
                weakSelf.loadingIndicator.startIndicator(message: "Loading Contacts")
            }
        }
    }
    
    func removeIndicator() {
        DispatchQueue.main.async { [weak self] in
            if let weakSelf = self {
                if (weakSelf.loadingIndicator != nil) {
                    weakSelf.loadingIndicator.stopIndicator()
                    weakSelf.loadingIndicator.removeFromSuperview()
                    weakSelf.loadingIndicator = nil
                }
            }
        }
    }
}
