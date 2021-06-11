//
//  ReviewCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorContentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    //MARK: Setup View Review cell
    func setupView() {
        reviewView.setViewtyle(radius: 5.0)
        authorProfileImageView.setCornerStyle()
    }
    
    //MARK: Setup Data Review cell
    func setupData(reviews: MovieReviewsModel, index: Int) {
        let imageConfig: MoviePosterImageModel = ImageConfigHelper.shared.movieImageConfig!
        self.authorProfileImageView.af.setImage(withURL: URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.logoSizes?[1] ?? "")/\(reviews.results?[index].authorDetails?.avatarPath ?? "")")!, placeholderImage: #imageLiteral(resourceName: "avatar") )
        self.authorNameLabel.text = reviews.results?[index].author
        self.authorContentLabel.text = reviews.results?[index].content
    }
}
