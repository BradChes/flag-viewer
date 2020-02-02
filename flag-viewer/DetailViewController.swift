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
    
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCountry
        navigationItem.largeTitleDisplayMode = .never
        
        if let countryToLoad = selectedCountry {
            imageView.image = UIImage(named: countryToLoad)
        }
    }
}
