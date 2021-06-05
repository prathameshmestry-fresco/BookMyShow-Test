//
//  ReusableCollectionViewTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class ReusableCollectionViewTableViewCell: UITableViewCell {

    @IBOutlet weak var colllectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupView() {
        
    }
    
}
