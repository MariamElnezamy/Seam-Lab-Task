//
//  HomeModel.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let status : String?
    let totalResults : Int?
    let articles : [Articles]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}

// MARK: - Article
struct Articles : Codable {
    let source : Source?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?

    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

// MARK: - Source
struct Source : Codable {
    let id : String?
    let name : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
