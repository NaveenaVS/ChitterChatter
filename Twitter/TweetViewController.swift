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

        //want to display the cursor with keyboard when tweet is clicked so that the user is prompted to type something:
        tweetTextView.becomeFirstResponder() //ensures that the app knows it can take text in so display the cursor. 
    }
    
    @IBOutlet weak var tweetTextView: UITextView! //text view as an outlet cus we wanna refer to it 
    
    
    @IBAction func cancel(_ sender: Any) {
        //when user presses this button we want to cancel the tweet.
        //so we use dismiss:
        dismiss(animated: true, completion: nil) //nil cus we don't want it to perform any action
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        //if the tweet is empty we dont to send it to our api caller
        //need to put self because its in a closure
        if(!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error in posting the tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
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
