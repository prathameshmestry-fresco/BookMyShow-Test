//
//  ViewController.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var movieModel = MovieListViewModel()
    var movieList: [MovieDetailModel]?
    
    enum CellNames: String {
        case movieListTableViewCell = "MovieListTableViewCell"
    }
    
    let cellIdentifiers: [String] = [CellNames.movieListTableViewCell.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getMovieList()
    }
    
    func setupView() {
        self.title = "Movies"
        self.movieSearchBar.delegate = self
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
    
    func getMovieList() {
        movieModel.delegate = self
        movieModel.vc = self
        movieModel.getMovieNowPlayingList()
    }
    
    //MARK: Setup TableView
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerNibs(cellIdentifiers)
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

// MARK: UITableView DataSource Method
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel.movieList?.movieResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.movieListTableViewCell.rawValue) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(movieData: (movieModel.movieList?.movieResult?[indexPath.row])!)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: UITableView Delegate Method
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController")) as! MovieDetailsViewController
        movieDetailsViewController.title = movieModel.movieList?.movieResult?[indexPath.row].title
        movieDetailsViewController.movieId =  movieModel.movieList?.movieResult?[indexPath.row].id
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //self.movieList = self.movieModel.movieList?.movieResult
        if (searchText.isEmpty) {
            self.movieModel.movieList?.movieResult = self.movieList
        } else {
            self.movieModel.movieList?.movieResult = self.movieModel.movieList?.movieResult?.filter{$0.movieOriginalTitle?.range(of: searchText, options: [.caseInsensitive]) != nil}
           // self.movieModel.movieList?.movieResult = self.movieModel.movieList?.movieResult?.filter{($0.movieOriginalTitle?.contains(searchText))!}
        }
        self.tableView.reloadData()
    }
    
}

extension ViewController: MovieListViewModelDelegate {
    
    func didGetMovieListData() {
        self.tableView.reloadData()
    }
}
