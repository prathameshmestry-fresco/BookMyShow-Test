//
//  CreditsCollectionViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 07/06/21.
//

import UIKit

class CreditsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castOriginalName: UILabel!
    @IBOutlet weak var castCharacterName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(credit: MovieCreditModel, index: Int) {
        self.castOriginalName.text = "\(credit.cast?[index].name ?? "") (\(credit.cast?[index].knownDepartment ?? ""))"
        self.castCharacterName.text = credit.cast?[index].character
    }

}
