//
//  ViewController.swift
//  flag-viewer
//
//  Created by Bradley Chesworth on 02/02/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
                
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                // This is a flag to load
                flags.append(item)
            }
        }
        flags.sort()
        
        print(flags)
    }
}

