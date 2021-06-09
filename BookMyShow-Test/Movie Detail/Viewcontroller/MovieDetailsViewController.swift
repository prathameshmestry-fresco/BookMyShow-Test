//
//  MovieDetailsViewController.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var movieModel = MovieDetailViewModel()
    var movieId: Int?
    
    enum CellNames: String {
        case movieSynopsisTableViewCell = "MovieSynopsisTableViewCell"
        case reusableCollectionViewTableViewCell = "ReusableCollectionViewTableViewCell"
    }
    
    let cellIdentifiers: [String] = [CellNames.movieSynopsisTableViewCell.rawValue, CellNames.reusableCollectionViewTableViewCell.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupTableView()
        getMovieDetails()
    }
    
    func getMovieDetails() {
        movieModel.delegate = self
        let group = DispatchGroup()
        
        group.enter()
        movieModel.getMovieSynoposisData(id: self.movieId!, sectionIndex: 0)
        group.leave()
        
        group.enter()
        movieModel.getMovieReviewsData(id: self.movieId!, sectionIndex: 1)
        group.leave()
        
        group.enter()
        movieModel.getMovieCreditData(id: self.movieId!, sectionIndex: 2)
        group.leave()
        
        group.enter()
        movieModel.getSimilarMovieData(id: self.movieId!, sectionIndex: 3)
        group.leave()
        
        group.notify(queue: DispatchQueue.main) {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Setup TableView
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.registerNibs(cellIdentifiers)
    }
    
}

extension MovieDetailsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("Count \(movieModel.sections.count)")
        return movieModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Section \(indexPath.section)")
        let section = movieModel.sections[indexPath.section]
        
        if section == .synopsis {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.movieSynopsisTableViewCell.rawValue) as? MovieSynopsisTableViewCell else {
                return UITableViewCell()
            }
            if let data = movieModel.movieSynopsis {
                cell.setupData(synopsisData: data)
            }
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.reusableCollectionViewTableViewCell.rawValue) as? ReusableCollectionViewTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor.red
            cell.setupData(section: section, model: self.movieModel)
            return cell
            
        }
    }
    
}

extension MovieDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //print("Section \(indexPath.section)")
        let section = movieModel.sections[indexPath.section]
        if section == .synopsis {
            return UITableView.automaticDimension
        } else if section == .reviews {
            return 100.0
        } else if section == .credits || section == .similarMovies {
            return 170.0
        }
        return 0.0
    }
    
}

extension MovieDetailsViewController: MovieDetailViewModelDelegate {
    func didGetMovieDetailsData(index: Int) {
        self.tableView.reloadData()
        //self.tableView.reloadSections(IndexSet(integer: index), with: .fade)
    }
}
