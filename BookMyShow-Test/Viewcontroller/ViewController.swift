//
//  ViewController.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movieModel = MovieListViewModel()

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
        self.navigationController?.title = "Movies"
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
    
    func getMovieList() {
        movieModel.delegate = self
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
        movieDetailsViewController.title = "Movie"
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}

extension ViewController: MovieListViewModelDelegate {
    
    func didGetMovieListData() {
        self.tableView.reloadData()
    }
}
