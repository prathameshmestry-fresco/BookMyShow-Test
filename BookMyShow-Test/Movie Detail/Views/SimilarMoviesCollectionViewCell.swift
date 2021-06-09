//
//  SimilarMoviesCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var similarMovieNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(similarMovie: SimilarMoviesModel, index: Int) {
        similarMovieNameLabel.text = similarMovie.results?[index].originalTitle
        languageLabel.text = similarMovie.results?[index].originalLanguage
    }

}
