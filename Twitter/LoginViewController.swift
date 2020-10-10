//
//  LoginViewController.swift
//  Twitter
//
//  Created by Naveena vishnu on 10/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //checking if you're actually setting the user default when we log in first
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            //task: don't ask for log in again; just run segue immediately
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    //creating connection to screen's button as an action
    @IBAction func onLoginButton(_ sender: Any) {
       //we want to have a login!!
        //in starter we have the set up of the api call to twitter already created so we use that and code:
        let myURL = "https://api.twitter.com/oauth/request_token" //called specific endpoint that controls our login
        TwitterAPICaller.client?.login(url: myURL, success: {
            
            //writing note in memory:
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Login failed!")
        }) //the api caller
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
