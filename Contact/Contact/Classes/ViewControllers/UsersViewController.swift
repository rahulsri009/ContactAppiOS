//
//  UsersViewController.swift
//  Contact
//
//  Created by Rahul Srivastava on 21/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

enum UserOrder {
    case ascending, descending
}

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    var webserviceManager:WebserviceManager!
    var mainNavigationController:MainNavigationViewController!
    var contacts:[Contact] = []
    var userOrder:UserOrder = .ascending
    var selectedContact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainNavigationController = navigationController as! MainNavigationViewController
        tableView.tableFooterView = UIView()
        fetchContactList()
    }
    
    func fetchContactList() {
        mainNavigationController.showIndicator()
        webserviceManager = WebserviceManager()
        webserviceManager.callWebservice {[weak self] (response) in
            if let weakSelf = self {
                weakSelf.mainNavigationController.removeIndicator()
                if let userModel:UsersModel = response as? UsersModel {
                    weakSelf.reloadTableView(with: userModel.contacts)
                } else {
                    weakSelf.showAlert(messageString: "Something went wrong. Please retry.")
                }
            }
        }
    }
    
    func reloadTableView(with contactsModel:[Contact]) {
        contacts = contactsModel.sorted(by: { (firstContact, secondContact) -> Bool in
            return firstContact.name.localizedCaseInsensitiveCompare(secondContact.name) == (userOrder == .ascending ? ComparisonResult.orderedAscending : ComparisonResult.orderedDescending)
        })
        if userOrder == .ascending {
            rightBarButton.title = "Z-A"
        } else {
            rightBarButton.title = "A-Z"
        }
        DispatchQueue.main.async {[weak self] in
            if let weakSelf = self {
                weakSelf.tableView.reloadData()
            }
        }
    }
    
    func showAlert(messageString:String) {
        DispatchQueue.main.async { [weak self] in
            if let weakSelf = self {
                let alertController = UIAlertController(title: nil, message: messageString, preferredStyle: .alert)
                let retryAction = UIAlertAction(title: "Retry", style: .default, handler: { (alertAction) in
                    weakSelf.fetchContactList()
                })
                alertController.addAction(retryAction)
                weakSelf.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailsSegueIndentifier" {
            let destnationViewController:ContactViewController = segue.destination as! ContactViewController
            destnationViewController.contact = selectedContact
        }
    }
    
    @IBAction func rightBarButtonAction(_ sender: UIBarButtonItem) {
        if userOrder == .ascending {
            userOrder = .descending
        } else {
            userOrder = .ascending
        }
        reloadTableView(with: contacts)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")!
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedContact = contacts[indexPath.row]
        performSegue(withIdentifier: "contactDetailsSegueIndentifier", sender: self)
    }
}
