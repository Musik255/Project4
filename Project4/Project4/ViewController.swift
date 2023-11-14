//
//  ViewController.swift
//  Project4
//
//  Created by Павел Чвыров on 13.11.2023.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                pictures.append(item)
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameСountry", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let index = pictures[indexPath.row].firstIndex(of: "@")
        let country = pictures[indexPath.row]
        
        
        content.text = String(country[..<index!]).capitalized
        content.image = UIImage(named: pictures[indexPath.row])
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewControllerCell = storyboard?.instantiateViewController(withIdentifier: "imageFlag") as? CellFlag else{
            return
        }
        viewControllerCell.selectedFlag = pictures[indexPath.row]
        navigationController?.pushViewController(viewControllerCell, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 40
    }
    
}

