//
//  MovieSynopsisTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class MovieSynopsisTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTagLineLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieOverViewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(synopsisData: MovieSynopsisModel) {
        movieTitleLabel.text = synopsisData.title
        movieTagLineLabel.text = synopsisData.tagLine
        movieReleaseDateLabel.text = synopsisData.releaseDate
        moviePopularityLabel.text = "\(synopsisData.popularity ?? 0)"
        movieOverViewLabel.text = synopsisData.movieOverview
    }
    
}
