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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let countryToLoad = selectedCountry {
            imageView.image = UIImage(named: countryToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let country = imageView.image?.jpegData(compressionQuality: 0.8) else {
             print("No image found")
             return
         }
         
         let vc = UIActivityViewController(activityItems: [country], applicationActivities: [])
         
         vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
         
         present(vc, animated: true)
    }
}
