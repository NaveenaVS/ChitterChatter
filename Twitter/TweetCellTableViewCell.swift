//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Naveena vishnu on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    //creating outlets:
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
   
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    //fav button basically works on toggling: if fav then u unfav it and vice versa:
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Failed to favorite tweet: \(error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("falied to unfavortie tweet: \(error)")
            })
        }
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        //when the retweet is set (vis setretweeted method below) we wanna enabel the user to retweet stuff
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Retweeting failed: \(error)")
        })
    }
    
    //var means value can be changed later
    var favorited:Bool = false
    var tweetId:Int = -1 //negative no. so we know its not set; we set this in the hometableviewcontroller and this var is passed to the apicaller func where we use it for fav/unfav a tweet
    
    //var retweeted:Bool = false making this a function instead
    func setRetweeted(_ isRetweeted:Bool){
        
        if(isRetweeted){
            //if retweeted we want to set the retweet image to be set to the green version:
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            //don't want anything to happen when the user presses on it so set it to not enable
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
                       //set button to grey back
                       retweetButton.isEnabled = true
        }
        
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            //if set then change heart color to red else chnage to greay
            favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
