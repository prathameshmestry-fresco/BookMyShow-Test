//
//  MovieSynopsisTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit
import AlamofireImage

class MovieSynopsisTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTagLineLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieVoteAverageLabel: UILabel!
    @IBOutlet weak var movieOverViewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        moviePosterImageView.setCornerStyle()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(synopsisData: MovieSynopsisModel) {
        let imageConfig: MoviePosterImageModel = ImageConfigHelper.shared.movieImageConfig!
        moviePosterImageView.af.setImage(withURL: URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.backdropSizes?[2] ?? "")/\(synopsisData.backdropPath ?? "")")!)
        movieTitleLabel.text = synopsisData.title
        movieTagLineLabel.text = synopsisData.tagLine
        movieReleaseDateLabel.text = "Release Date:\(synopsisData.releaseDate ?? "") (\(synopsisData.isMovieAdult ?? false ? "A" : "U"))"
        movieVoteAverageLabel.text = "Vote Average: \(synopsisData.voteAverage ?? 0)"
        movieOverViewLabel.text = synopsisData.movieOverview
    }
    
}
