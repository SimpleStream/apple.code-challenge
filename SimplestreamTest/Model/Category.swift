//
//  Category.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 21/09/2021.
//

import Foundation

//MARK: - Category
struct Category: Codable {
    
    let name: String
    let videos: [Video]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case videos = "videos"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
                
        self.name = try container.decodeIfPresent(String.self, forKey: CodingKeys.name) ?? ""
        self.videos = try container.decodeIfPresent([Video].self, forKey: CodingKeys.videos) ?? []
    }
}

//MARK: - Video
struct Video: Codable {
    
    let thumbnail: String
    let title: String
    let sources: [String]
    let subtitle: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case thumbnail = "thumb"
        case title = "title"
        case sources = "sources"
        case subtitle = "subtitle"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: CodingKeys.thumbnail) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: CodingKeys.title) ?? ""
        self.sources = try container.decodeIfPresent([String].self, forKey: CodingKeys.sources) ?? []
        self.subtitle = try container.decodeIfPresent(String.self, forKey: CodingKeys.subtitle) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: CodingKeys.description) ?? ""
    }
}
