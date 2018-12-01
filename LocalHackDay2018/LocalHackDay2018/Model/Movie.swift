//
//  File.swift
//  LocalHackDay2018
//
//  Created by Ziad Hamdieh on 2018-12-01.
//  Copyright © 2018 Jarvis Wu. All rights reserved.
//

import UIKit

struct Movie {
    var title = String()
    var genre = String()
    var rating = Float()
    var imageUrl = String()
    
    init(title: String, genre: String, rating: Float, imageUrl: String) {
        self.title = title
        self.genre = genre
        self.rating = rating
        self.imageUrl = imageUrl
    }
}
