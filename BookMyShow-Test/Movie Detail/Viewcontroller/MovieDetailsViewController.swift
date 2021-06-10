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
    
    //MARK: Setup View
    func setupView() {
        setupTableView()
        getMovieDetails()
    }
    
    //MARK: Get Movie Details APIs
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

//MARK: UITableView DataSource Methods
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
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.reusableCollectionViewTableViewCell.rawValue) as? ReusableCollectionViewTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.setupData(section: section, model: self.movieModel)
            return cell
            
        }
    }
    
}

//MARK: UITableView Delegate Methods
extension MovieDetailsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = movieModel.sections[indexPath.section]
        if section == .synopsis {
            return UITableView.automaticDimension
        } else if section == .reviews {
            return 150.0
        } else if section == .credits || section == .similarMovies {
            return 300.0
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = movieModel.sections[section]
        if section == .synopsis {
            return 0.0
        } else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieModel.sections[section].rawValue
    }
}

//MARK: MovieDetailViewModel Delegate Methods
extension MovieDetailsViewController: MovieDetailViewModelDelegate {
    func didGetMovieDetailsData(index: Int) {
        self.tableView.reloadData()
    }
}
