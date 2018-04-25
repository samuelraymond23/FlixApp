//
//  DetailViewController.swift
//  FlixApp
//
//  Created by student on 4/1/18.
//  Copyright © 2018 Samuel Raymond. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "paster_path"
}

class DetailViewController: UIViewController
    {
    
    
    @IBOutlet var backDropImageView: UIImageView!
    
    @IBOutlet var posterImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var releaseDateLabel: UILabel!
    
    @IBOutlet var overviewLabel: UILabel!
    
    var photoUrl: URL!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let movie = movie {
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.release_date
            overviewLabel.text = movie.overview
            
            if posterImageView != nil {
                posterImageView.af_setImage(withURL: movie.posterUrl!)
            }
            
            if backDropImageView != nil {
                backDropImageView.af_setImage(withURL: movie.backdropUrl!)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
