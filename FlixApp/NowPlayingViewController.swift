//
//  NowPlayingViewController.swift
//  FlixApp
//
//  Created by Samuel Raymond on 2/15/18.
//  Copyright © 2018 Samuel Raymond. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
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
                for movie in movies {
                    let title = movie["title"] as! String
                    print(title)
            }
        }
       
    }
    task.resume()
   
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
        
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        return cell
        
    }
    }



