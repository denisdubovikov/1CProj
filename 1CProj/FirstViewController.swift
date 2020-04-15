//
//  FirstViewController.swift
//  1CProj
//
//  Created by Денис Дубовиков on 15.04.2020.
//  Copyright © 2020 Денис Дубовиков. All rights reserved.
//

import UIKit
import SafariServices

class FirstViewController: UITableViewController {
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let secondVC = SecondViewController()
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        tableView.separatorStyle = .none
           // Do any additional setup after loading the view.
       }
       
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitesMng.sites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myId")
        cell.textLabel?.text = sitesMng.sites[indexPath.row].name
        cell.detailTextLabel?.text = sitesMng.sites[indexPath.row].address
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            sitesMng.sites.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        if verifyUrl(urlString: sitesMng.sites[indexPath.row].address) {
            if let url_ = URL(string: sitesMng.sites[indexPath.row].address) {
                let svc = SFSafariViewController(url: url_)
                    present(svc, animated: true, completion: nil)
            }
        }
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

}

