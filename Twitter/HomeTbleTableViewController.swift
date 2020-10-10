//
//  HomeTbleTableViewController.swift
//  Twitter
//
//  Created by Naveena vishnu on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTbleTableViewController: UITableViewController {

    //Below we are creating the local container
    var tweetArray = [NSDictionary]()
    var numberOfTweet: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //need to call the loadTweet funct here: cus we want to call after the view loads!
        loadTweet()
    }
    
    
    //pulling tweets
    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"//copy twitter's recource url
        //set param for that resource url:
        let myParams = ["count":10]
        
        
        //call api:
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success: { (tweets: [NSDictionary]) in
            //repopulate: with new list evry time table is reloaded
            self.tweetArray.removeAll()
            
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Could not retrieve tweets!")
        })
        
        
        
        
    }
    
    
    
    //creating action for the logout button
    @IBAction func onLogout(_ sender: Any) {
        
        //call twittee api to logout
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        //need to set the user loggedIn to false..so the app remembers u logged out!
        UserDefaults.standard.set(false, forKey: "userLoggedIn")//use the exact same key -> this is the key that will be checked to see if the user logged in
    }
    
    //prototype cell code:
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        //extract user then user name cus it was nested in the response
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        
        //look at the api response to get the corresponding info
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as? String
        
        //pulling in the image: look at api response
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.profileImageView.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }


}
