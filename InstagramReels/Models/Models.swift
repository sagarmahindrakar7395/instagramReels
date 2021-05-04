//
//  Models.swift
//  InstagramReels
//
//  Created by Sagar Mahindrakar on 03/05/21.
//

import Foundation

struct Category: Codable {
    let title: String
    let nodes: [Node]
}

struct Node: Codable {
    let video: Video
}

struct Video: Codable {
    let encodeURI: String
    
    enum CodingKeys: String, CodingKey {
        case encodeURI = "encodeUrl"
    }
}


