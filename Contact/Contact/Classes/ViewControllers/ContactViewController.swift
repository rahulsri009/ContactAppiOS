//
//  ContactViewController.swift
//  Contact
//
//  Created by Rahul Srivastava on 22/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contact:Contact!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if contact != nil {
            title = contact.name
        }
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ContactViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "contactCellIdentifier")!
        let titleLabel:UILabel = cell.viewWithTag(101) as! UILabel
        let detailLabel:UILabel = cell.viewWithTag(102) as! UILabel
        switch indexPath.row {
        case 0:
            titleLabel.text = "Username"
            if let value: String = contact.username {
                detailLabel.text = value
            }
            break
        case 1:
            titleLabel.text = "Email"
            if let value: String = contact.email {
                detailLabel.text = value
            }
            break
        case 2:
            titleLabel.text = "Address"
            if let address: Address = contact.address {
                let addressString: String = "\(address.street ?? ""), \(address.suite ?? ""), \(address.city ?? "") - \(address.zipcode ?? "")"
                detailLabel.text = addressString
            }
            break
        case 3:
            titleLabel.text = "Phone"
            detailLabel.text = contact.phone
            break
        case 4:
            titleLabel.text = "Website"
            detailLabel.text = contact.website
            break
        case 5:
            titleLabel.text = "Company"
            detailLabel.text = contact.company.name
            break
        default:
            break
        }
        return cell
    }
}
