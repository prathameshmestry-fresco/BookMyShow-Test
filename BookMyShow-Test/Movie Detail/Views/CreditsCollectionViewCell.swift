//
//  CreditsCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 07/06/21.
//

import UIKit

class CreditsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castOriginalNameLabel: UILabel!
    @IBOutlet weak var castCharacterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(credit: MovieCreditModel, index: Int) {
        self.castOriginalNameLabel.text = "\(credit.cast?[index].name ?? "") (\(credit.cast?[index].knownDepartment ?? ""))"
        self.castCharacterNameLabel.text = credit.cast?[index].character
    }

}
