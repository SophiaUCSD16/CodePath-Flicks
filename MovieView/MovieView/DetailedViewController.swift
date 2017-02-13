//
//  DetailedViewController.swift
//  MovieView
//
//  Created by Jane on 2/13/17.
//  Copyright © 2017 Jingya Huang. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: NSDictionary!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        // Grab title for each movie
        let title = movie["title"] as? String
        titleLabel.text = title
        
        // Grab the overview for each movie
        let overview = movie["overview"] as? String
        overviewLabel.text = overview
        // set the corrrect size 
        overviewLabel.sizeToFit()
        
        // Grab the detailed image for each movie
        if let poster_path = movie["poster_path"]
            as? String {
            let base_url = "https://image.tmdb.org/t/p/w500/"
            let posterURL = URL(string: base_url + poster_path)!
            posterImageView.setImageWith(posterURL)
        } else {
            // No poster image. Can either set to nil (no image) or a default movie poster image
            // that you include as an asset
            posterImageView.image = nil
        }

        
        // Do any additional setup after loading the view.
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
