//
//  VideoManager.swift
//  VideoPlayerWithPexelsAPI
//
//  Created by Tommy Ludwig on 07.04.23.
//

import Foundation

class VideoManager: ObservableObject {
    @Published private(set) var videos: [Videos] = []
    @Published var searchQeuery: String = "" {
        didSet {
            Task {
                await requestVideos(query: searchQeuery)
            }
        }
    }
    
    init() {
        Task.init {
            await requestVideos(query: "nature")
        }
    }
    
    func requestVideos(query: String) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(query)&per_page=10&orientation=landscape") else {
                fatalError("The pexels url is missing")
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("SmKNlO0eKYgH56m2YeB6nfpmXdveo1u7z1kh77k1Ed6veqgyYKZM8BZB", forHTTPHeaderField: "Authorization")
            urlRequest.httpMethod = "GET"
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
           
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error while fetching data from pexels: \(response)")
                return
            }
            
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Response.self, from: data)
            
            DispatchQueue.main.async {
                self.videos = decodedData.videos
            }
        } catch {
            print("Error while fetching data from pexels: \(error)")
        }
    }
}
