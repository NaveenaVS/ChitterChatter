//
//  HomeTbleTableViewController.swift
//  Twitter
//
//  Created by Naveena vishnu on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTbleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //creating action for the logout button
    @IBAction func onLogout(_ sender: Any) {
        
        //call twittee api to logout
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        //need to set the user loggedIn to false..so the app remembers u logged out!
        UserDefaults.standard.set(false, forKey: "userLoggedIn")//use the exact same key -> this is the key that will be checked to see if the user logged in
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
