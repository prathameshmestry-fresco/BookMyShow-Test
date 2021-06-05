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
    
    enum CellNames: String {
        case movieSynopsisTableViewCell = "MovieSynopsisTableViewCell"
    }
    
    let cellIdentifiers: [String] = [CellNames.movieSynopsisTableViewCell.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupTableView()
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

extension MovieDetailsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.movieSynopsisTableViewCell.rawValue) as? MovieSynopsisTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}

extension MovieDetailsViewController : UITableViewDelegate {
    
}
