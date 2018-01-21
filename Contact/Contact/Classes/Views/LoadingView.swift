//
//  LoadingView.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var alertIndicator:UIActivityIndicatorView!
    var alertMessageLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        let alertView:UIView = UIView()
        alertView.backgroundColor = UIColor.white
        alertView.layer.cornerRadius = 10.0
        addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        
        alertView.layer.cornerRadius = 10.0
        alertView.layer.shadowColor = UIColor.black.cgColor
        alertView.layer.shadowOpacity = 0.8
        alertView.layer.shadowOffset = CGSize(width: 1, height: 1)
        alertView.layer.shadowRadius = 10
        
        NSLayoutConstraint(item: alertView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: alertView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: alertView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 220).isActive = true
        NSLayoutConstraint(item: alertView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 88).isActive = true
        
        alertIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        alertIndicator.color = UIColor.darkGray
        alertView.addSubview(alertIndicator)
        alertIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: alertIndicator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67).isActive = true
        NSLayoutConstraint(item: alertIndicator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67).isActive = true
        NSLayoutConstraint(item: alertIndicator, attribute: .leadingMargin, relatedBy: .equal, toItem: alertView, attribute: .leadingMargin, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: alertIndicator, attribute: .centerY, relatedBy: .equal, toItem: alertView, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0).isActive = true
        
        alertMessageLabel = UILabel()
        alertMessageLabel.numberOfLines = 0
        alertMessageLabel.textAlignment = .center
        alertMessageLabel.textColor = UIColor.darkGray
        alertView.addSubview(alertMessageLabel)
        alertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: alertMessageLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: alertView, attribute: .trailingMargin, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint(item: alertMessageLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: alertIndicator, attribute: .trailingMargin, multiplier: 1.0, constant: 8).isActive = true
        NSLayoutConstraint(item: alertMessageLabel, attribute: .bottomMargin, relatedBy: .equal, toItem: alertView, attribute: .bottomMargin, multiplier: 1.0, constant: -8).isActive = true
        NSLayoutConstraint(item: alertMessageLabel, attribute: .topMargin, relatedBy: .equal, toItem: alertView, attribute: .topMargin, multiplier: 1.0, constant: 8).isActive = true
        
    }
    
    func startIndicator(message:String) {
        alertIndicator.startAnimating()
        alertMessageLabel.text = message
    }
    
    func stopIndicator() {
        alertIndicator.stopAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
