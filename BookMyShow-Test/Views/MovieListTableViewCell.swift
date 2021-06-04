//
//  MovieListTableViewCell.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieListView: UIView!
    @IBOutlet weak var bookTicketButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView() {
        movieListView.setViewtyle(radius: 10.0)
        bookTicketButton.setBookButtonStyle()
    }
    
}
