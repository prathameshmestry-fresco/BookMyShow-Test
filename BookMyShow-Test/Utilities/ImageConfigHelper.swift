//
//  ImageConfigHelper.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 09/06/21.
//

import Foundation

class ImageConfigHelper {
    
    static let shared = ImageConfigHelper()
    var movieImageConfig: MoviePosterImageModel?
    
    func getImageConfig() {
        let movieManager = MovieListManager()
        movieManager.getMovieImageConfiguration() { (response) in
            self.movieImageConfig = response
        } errorCompletionHandler: { (error) in
            print("\(error?.localizedDescription ?? "")")
        }
    }
    
}
