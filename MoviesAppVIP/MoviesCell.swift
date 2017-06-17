//
//  MoviesCell.swift
//  MoviesAppVIP
//
//  Created by Kamil Zajac on 17.06.2017.
//  Copyright © 2017 Kamil Zajac. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell {

    @IBOutlet weak var voteLbl: UILabel!
    @IBOutlet weak var movieImgView: ImageMovieView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descTextView: UITextView!


    func configureCellWith(_ movies: Movies.Download.Response.Details) {
        DispatchQueue.main.async {
            self.titleLbl.text = movies.title
            self.voteLbl.text = "\(movies.vote ?? 0.0)"
            self.descTextView.text = movies.description
            self.movieImgView.loadImageFromURLString(movies.imagePath)
        }
    }
    
}
