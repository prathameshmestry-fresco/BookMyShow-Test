//
//  ReusableCollectionViewTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 05/06/21.
//

import UIKit

class ReusableCollectionViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var sectionName: MovieDetailViewModel.Section?
    var movieDetailsModel: MovieDetailViewModel?
    
    enum CellNames: String {
        case reviewCollectionViewCell = "ReviewCollectionViewCell"
        case creditsCollectionViewCell = "CreditsCollectionViewCell"
        case similarMoviesCollectionViewCell = "SimilarMoviesCollectionViewCell"
    }
    
    let cellIdentifiers: [String] = [CellNames.reviewCollectionViewCell.rawValue, CellNames.creditsCollectionViewCell.rawValue, CellNames.similarMoviesCollectionViewCell.rawValue]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Setup View
    func setupView() {
        setupCollectionView()
    }
    
    //MARK: Setup CollectionView
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.bounces = false
        self.collectionView.registerNibs(cellIdentifiers)
    }
    
    //MARK: Setup Data for CollectionView
    func setupData(section: MovieDetailViewModel.Section, model: MovieDetailViewModel) {
        self.sectionName = section
        self.movieDetailsModel = model
        self.collectionView.reloadData()
    }
    
}

//MARK: UICollectionView DataSource Methods
extension ReusableCollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sectionName {
        case .reviews:
            return self.movieDetailsModel?.movieReviews?.results?.count ?? 0
        case .credits:
            return self.movieDetailsModel?.movieCredit?.cast?.count ?? 0
        case .similarMovies:
            return self.movieDetailsModel?.similarMovie?.results?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sectionName {
        case .reviews:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.reviewCollectionViewCell.rawValue, for: indexPath) as? ReviewCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let movieReviews = self.movieDetailsModel?.movieReviews {
                cell.setupData(reviews: movieReviews, index: indexPath.row)
            }
            return cell
            
        case .credits:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.creditsCollectionViewCell.rawValue, for: indexPath) as? CreditsCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let movieCredit = self.movieDetailsModel?.movieCredit {
                cell.setupData(credit: movieCredit, index: indexPath.row)
            }
            return cell
            
        case .similarMovies:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellNames.similarMoviesCollectionViewCell.rawValue, for: indexPath) as? SimilarMoviesCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let similarMovie = self.movieDetailsModel?.similarMovie {
                cell.setupData(similarMovie: similarMovie, index: indexPath.row)
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch sectionName {
        case .reviews:
            return CGSize(width: self.frame.width - 100, height: 150)
        default:
            return CGSize(width: 170, height: 300.0)
            
        }
    }
}

//MARK: UICollectionView Delegate Methods
extension ReusableCollectionViewTableViewCell: UICollectionViewDelegate {
    
}
