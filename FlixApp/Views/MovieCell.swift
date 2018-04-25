//
//  MovieCell.swift
//  FlixApp
//
//  Created by Harold  on 2/28/18.
//  Copyright © 2018 Samuel Raymond. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie! {
        didSet {
            if movie.posterUrl != nil {
                imageLabel.af_setImage(withURL: movie.posterUrl!)
            }
            titleLabel.text = movie.title
            overViewLabel.text = movie.overview
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
