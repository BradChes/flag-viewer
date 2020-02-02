//
//  DetailViewController.swift
//  flag-viewer
//
//  Created by Bradley Chesworth on 02/02/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedCountryImage: String?
    var selectedCountryTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountryTitle
        navigationItem.largeTitleDisplayMode = .never
        
        if let countryToLoad = selectedCountryImage {
            imageView.image = UIImage(named: countryToLoad)
        }
    }
}
