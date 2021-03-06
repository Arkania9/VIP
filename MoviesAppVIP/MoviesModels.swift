//
//  MoviesModels.swift
//  MoviesAppVIP
//
//  Created by Kamil Zajac on 17.06.2017.
//  Copyright (c) 2017 Kamil Zajac. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct Movies
{
    struct Download
    {
        struct Request
        {
            var movieType: String
            var page: Int
        }
        struct Response
        {
            struct Json {
                var moviesDict: [[String: Any]]
            }
            
            struct Error {
                var error: String
            }
            
            struct Details {
                var vote: Double?
                var title: String?
                var description: String?
                var posterPath: String?
                var imagePath: String {
                    return "https://image.tmdb.org/t/p/w300\(posterPath ?? "")"
                }
            }
            
        }
        struct ViewModel
        {
            struct Success {
                var movies: [Movies.Download.Response.Details]
            }
            struct Error {
                var alert: UIAlertController
            }
        }
    }
}
