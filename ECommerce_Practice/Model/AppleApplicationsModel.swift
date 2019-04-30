//
//  AppleApplicationsModel.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/30/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import Foundation

struct AppleApps:Codable{
  var  feed:Feed
}
struct Feed: Codable {
    
    var title: String
    var country: String
    var results: [Result]
    
}


struct Result: Codable {
    
    var name:String
    var releaseDate:String
    var artworkUrl100: String
    
}
