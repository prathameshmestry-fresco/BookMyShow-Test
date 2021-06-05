//
//  MovieDetailViewModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

protocol MovieDetailViewModelDelegate {
    func didGetMovieListData()
}

class MovieDetailViewModel {
    
    enum Section {
        case synopsis,
             reviews,
             credits,
             similarMovies
    }
    
    var sections: [Section] = []
    
    func getMovieSynoposisData(id: Int) {
        let movieManager = MovieListManager()
        movieManager.getMovieSynopsisDetail(movieId: id) { (response) in
            
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }

    }
}
