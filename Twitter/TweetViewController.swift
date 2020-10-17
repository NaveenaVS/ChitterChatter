//
//  TweetViewController.swift
//  Twitter
//
//  Created by Naveena vishnu on 10/17/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        //when user presses this button we want to cancel the tweet.
        //so we use dismiss:
        dismiss(animated: true, completion: nil) //nil cus we don't want it to perform any action
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        
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
