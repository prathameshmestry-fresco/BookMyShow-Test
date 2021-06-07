//
//  ReusableCollectionViewTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class ReusableCollectionViewTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    enum CellNames: String {
        case reviewCollectionViewCell = "ReviewCollectionViewCell"
    }
    
    let cellIdentifiers: [String] = [CellNames.reviewCollectionViewCell.rawValue]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.bounces = false
        //self.collectionView.setContentOffset(self.collectionView.contentOffset, animated: false)
        //self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.registerNibs(cellIdentifiers)
    }
    
    func setupData() {
        self.setupCollectionView()
    }
    
}

extension ReusableCollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.reviewCollectionViewCell.rawValue, for: indexPath) as? ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 300)
    }
}

extension ReusableCollectionViewTableViewCell: UICollectionViewDelegate {
    
}
