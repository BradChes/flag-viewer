//
//  ViewController.swift
//  flag-viewer
//
//  Created by Bradley Chesworth on 02/02/2020.
//  Copyright © 2020 Brad Chesworth. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

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
                countries.append(item)
            }
        }
        countries.sort()
        
        print(countries)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.textLabel?.text = titleFormation(countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedCountryTitle = titleFormation(countries[indexPath.row])
            vc.selectedCountryImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func titleFormation(_ title: String) -> String {
        var formatingTitle = String(title.dropLast(4))
        if formatingTitle.count > 3 {
            formatingTitle = formatingTitle.capitalized
        } else {
            formatingTitle = formatingTitle.uppercased()
        }
        return formatingTitle
    }
}

