//
//  ReviewCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorContentLabel: UILabel!
    @IBOutlet weak var authorRatingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        self.backgroundColor = UIColor.red
    }
    
    func setupData(reviews: MovieReviewsModel, index: Int) {
        self.authorNameLabel.text = reviews.results?[index].author
        self.authorContentLabel.text = reviews.results?[index].content
        self.authorRatingLabel.text = "\(reviews.results?[index].authorDetails?.rating ?? 0)"
    }
}
