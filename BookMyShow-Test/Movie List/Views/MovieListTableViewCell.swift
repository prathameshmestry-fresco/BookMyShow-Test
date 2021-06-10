//
//  MovieListTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit
import AlamofireImage

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieListView: UIView!
    @IBOutlet weak var bookTicketButton: UIButton!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var movieVoteCountLabel: UILabel!
    @IBOutlet weak var movieLanguageLabel: UILabel!
    @IBOutlet weak var movieAdultLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Setup View for MovieList Cell
    func setupView() {
        movieListView.setViewtyle(radius: 10.0)
        bookTicketButton.setBookButtonStyle()
    }
    
    //MARK: Setup data in MovieList Cell
    func setupData(movieData: MovieDetailModel) {
        let imageConfig: MoviePosterImageModel = ImageConfigHelper.shared.movieImageConfig!
        let imgUrl = URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.logoSizes?[3] ?? "")/\(movieData.posterUrl ?? "")")
        self.moviePosterImageView.af.setImage(withURL: imgUrl!)
        self.movieNameLabel.text = movieData.title
        self.releaseDataLabel.text = "Release On: \(movieData.releaseDate ?? "")"
        self.movieVoteCountLabel.text = "\(movieData.voteCount ?? 0) Votes"
        self.movieLanguageLabel.text = "\(movieData.language?.capitalized ?? "")"
        self.movieAdultLabel.text = movieData.isMovieAdult ?? false ? "A" : "U"

    }
}
