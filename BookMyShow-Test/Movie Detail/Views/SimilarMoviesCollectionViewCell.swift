//
//  SimilarMoviesCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 08/06/21.
//

import UIKit
import AlamofireImage

class SimilarMoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var similarMovieImageView: UIImageView!
    @IBOutlet weak var similarMovieNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: Setup View Similar Movies cell
    func setupView() {
        similarMovieImageView.setCornerStyle()
    }
    
    //MARK: Setup Data Similar Movies cell
    func setupData(similarMovie: SimilarMoviesModel, index: Int) {
        let imageConfig: MoviePosterImageModel = ImageConfigHelper.shared.movieImageConfig!
        similarMovieImageView.af.setImage(withURL: URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.logoSizes?[4] ?? "")/\(similarMovie.results?[index].backdropPath ?? "")")!, placeholderImage: #imageLiteral(resourceName: "movie"))
        similarMovieNameLabel.text = similarMovie.results?[index].originalTitle
        languageLabel.text = similarMovie.results?[index].originalLanguage?.capitalized
    }

}
