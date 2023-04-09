//
//  ViewModel.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

/// APIKey: SmKNlO0eKYgH56m2YeB6nfpmXdveo1u7z1kh77k1Ed6veqgyYKZM8BZB

import Foundation

struct Response: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Videos]
}

struct Videos: Identifiable, Decodable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]
    
    struct User: Identifiable, Decodable {
        var id: Int
        var name: String
        var url: String
    }
    
    struct VideoFile: Identifiable, Decodable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
    }
}
