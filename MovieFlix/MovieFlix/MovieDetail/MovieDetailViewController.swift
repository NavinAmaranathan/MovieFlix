//
//  MovieDetailViewController.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var star: UILabel!
    @IBOutlet var overview: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let movie = movie {
            titleLabel.text = movie.originalTitle
            star.text = String(movie.voteAverage)
            overview.text = movie.overview
            let imagePath = movie.posterPath
            let imageString = APIConstants.posterPath.rawValue + imagePath
            let url = URL(string: imageString)!
            let data = try? Data(contentsOf: url)
            image.image = UIImage(data: data!)
        }
    }
}
