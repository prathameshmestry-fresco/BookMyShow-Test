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
    @IBOutlet weak var otherDetailsLabel: UILabel!
    @IBOutlet weak var movieAdultLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView() {
        movieListView.setViewtyle(radius: 10.0)
        bookTicketButton.setBookButtonStyle()
    }
    
    func setupData(movieData: MovieDetailModel, imageConfig: MoviePosterImageModel) {
        let imgUrl = URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.logoSizes?[3] ?? "")/\(movieData.posterUrl ?? "")")
        self.moviePosterImageView.af.setImage(withURL: imgUrl!)
        self.movieNameLabel.text = movieData.title
        self.releaseDataLabel.text = "Release On: \(movieData.releaseDate ?? "")"
        self.otherDetailsLabel.text = movieData.movieOverview
        self.movieAdultLabel.text = movieData.isMovieAdult ?? false ? "A" : "U"

    }
}
