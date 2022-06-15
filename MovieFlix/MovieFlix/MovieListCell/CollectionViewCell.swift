//
//  CollectionViewCell.swift
//  MovieFlix
//
//  Created by Navi on 07/06/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier: String = "customCell"
    var movie: Movie?
    
    static func nib() -> UINib {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        return nib
    }
    
    @IBOutlet var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(image)
        contentView.layer.cornerRadius = 20
    }

    func configure() {
        setBGImage()
    }

    private func setBGImage() {
        let string = APIConstants.backdropPath.rawValue + ( movie?.backdropPath ?? "" )
        let url = URL(string: string)!
        let data = try? Data(contentsOf: url)
        image.image = UIImage(data: data!)
    }
}
