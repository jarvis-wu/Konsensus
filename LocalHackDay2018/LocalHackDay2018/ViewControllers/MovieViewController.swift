//
//  MovieViewController.swift
//  LocalHackDay2018
//
//  Created by Jarvis Wu on 2018-12-01.
//  Copyright © 2018 Jarvis Wu. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // mock data
    var tweets = [[String : Any]]()
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var twitterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twitterTableView.delegate = self
        twitterTableView.dataSource = self
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        self.twitterTableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getTweets()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = twitterTableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
        if let tweet = tweets[indexPath.row]["tweet"] as? String {
            cell.tweetLabel.text = tweet
        }
        if let score = tweets[indexPath.row]["score"] as? Double {
            cell.timeLabel.text = "Consensus Score: " + String(Int(round(score * 100)))
        }
        return cell
    }
    
    func getTweets() {
        let movieName = titleLabel.text!.lowercased().replacingOccurrences(of: " ", with: "%20")
        let urlStringRoot = "http://localhost:5000/api/sentiment/tweets?query=\(movieName)"
        let url = URL(string: urlStringRoot)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
                    if let overallScore = parsedData["score"] as? Double {
                        DispatchQueue.main.async {
                            self.scoreLabel.text = String(Int(round(overallScore * 100)))
                        }
                    } else {
                        print("failed getting overall score")
                    }
                    if let tweets = parsedData["tweets"] as? [[String : Any]] {
                        self.tweets = tweets
                        DispatchQueue.main.async {
                            self.twitterTableView.reloadData()
                        }
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    

}
