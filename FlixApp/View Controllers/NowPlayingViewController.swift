//
//  NowPlayingViewController.swift
//  FlixApp
//
//  Created by Samuel Raymond on 2/15/18.
//  Copyright © 2018 Samuel Raymond. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var movieData: [[String: Any]] = [[:]]
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    activityIndicator.startAnimating()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)

        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        tableView.rowHeight = 250
        
      let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=dca4026e34b5abb1139f4dfbe652ac3c")!
      let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
      let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
                
            }else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movieData = movies
                self.tableView.reloadData()
        }
       
    }
    task.resume()
   
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
        
        }
    
    @objc func didPullToRefresh() {
        refreshControl.endRefreshing()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movieData[indexPath.item]
        
       
        cell.titleLabel.text = movie["original_title"] as? String
        cell.overViewLabel.text = movie["overview"] as? String
        
        let posterPathString = movie["poster_path"] as? String
        let baseUrlString = "https://image.tmdb.org/t/p/w500"
        if posterPathString != nil {
            let imageUrlString = baseUrlString + posterPathString!
            let imageUrl = URL(string: imageUrlString)
            cell.imageLabel.af_setImage(withURL: imageUrl!)
        }
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movieData[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
        }
    }
}




