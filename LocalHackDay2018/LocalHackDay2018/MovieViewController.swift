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
    let tweets = [("God i don't understand the hate, i absolutely loved it for what it was, maybe it's because i haven't seen the original classic, but the film delivered what i expected 😏", "4 min"),
                  ("I expected the movie will be good. But it is actually boring 😟😟😟", "13 min"),
                  ("This movie is the best in its kind. Looking for something not to terrify you much, watch this movie.", "23 min"),
                  ("one of the best sci-fi movie I have ever seen.Scarlette was just awesome.It the lovely combination of sci-fi and human emotions....", "2 hrs"),
                  ("As a long fan of Ghost in the shell original movie and it's anime adaptions, I'm disappointed at the way they handled the plot structure.", "3 hrs")]
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = twitterTableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
        cell.tweetLabel.text = tweets[indexPath.row].0
        cell.timeLabel.text = tweets[indexPath.row].1
        return cell
    }
    
    

}
