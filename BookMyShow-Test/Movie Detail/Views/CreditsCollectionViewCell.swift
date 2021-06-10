//
//  CreditsCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 07/06/21.
//

import UIKit

class CreditsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castProfileImageView: UIImageView!
    @IBOutlet weak var castOriginalNameLabel: UILabel!
    @IBOutlet weak var castCharacterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: Setup View Credits cell
    func setupView() {
        castProfileImageView.setCornerStyle()
    }
    
    //MARK: Setup Data Credits cell
    func setupData(credit: MovieCreditModel, index: Int) {
        let imageConfig: MoviePosterImageModel = ImageConfigHelper.shared.movieImageConfig!
        castProfileImageView.af.setImage(withURL: URL(string: "\(imageConfig.images?.secureBaseURL ?? "")/\(imageConfig.images?.logoSizes?[3] ?? "")/\(credit.cast?[index].profilePath ?? "")")!)
        self.castOriginalNameLabel.text = "\(credit.cast?[index].name ?? "") (\(credit.cast?[index].knownDepartment ?? ""))"
        self.castCharacterNameLabel.text = credit.cast?[index].character
    }

}
