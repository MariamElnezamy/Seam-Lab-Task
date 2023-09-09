//
//  MockData.swift
//  Seamlabs TaskTests
//
//  Created by Mariam on 07/09/2023.
//

@testable import Seamlabs_Task
import Foundation
import Combine


struct MockData {
    
    static let homeModel = HomeModel(status: "success", totalResults: 1, articles:
                                        [Articles(source: Source(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: ""),
                                            Articles(source: Source(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: "")])
    
    static let homeRequest = HomeRequest(q: "tesla")
}
