//
//  MoviesWorker.swift
//  MoviesAppVIP
//
//  Created by Kamil Zajac on 17.06.2017.
//  Copyright (c) 2017 Kamil Zajac. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class MoviesWorker
{
    // MARK: - Business Logic
    
    struct MovieAPI {
        static let moviesUrl = "\(MovieURL.MovieURL)movie/"
        static let moviesUrlP2 = "\(APIKey.APIKey)&page="
    }
    
    enum Result<T> {
        case Success(T)
        case Error(String)
    }
    
    func downloadMoviesWith(movieType: String, and page: Int,  completion: @escaping (Result<[[String: Any]]>) -> Void) {
        let url = "\(MovieAPI.moviesUrl)\(movieType)\(MovieAPI.moviesUrlP2)\(page)"
        guard let mainUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: mainUrl) { (data, response, error) in
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error!.localizedDescription)) }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: Any] else { return }
                guard let result = json["results"] as? [[String: Any]] else { return }
                DispatchQueue.main.async {
                    completion(.Success(result))
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
        }.resume()
    }
    
}
