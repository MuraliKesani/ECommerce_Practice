//
//  ViewController.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController : UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return ""
        }else if section == 1{
            return "Free Apps"
        }else if section == 2{
            return "Paid Apps"
        }else{
            return "Trending Apps"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "LogoTableViewCell", for: indexPath) as! LogoTableViewCell
            
            return cell
            
        }else if indexPath.section == 1{
            var cell = tableView.dequeueReusableCell(withIdentifier: "FreeApsTableViewCell", for: indexPath) as! FreeApsTableViewCell
            
            return cell
        }else if indexPath.section == 2{
            var cell = tableView.dequeueReusableCell(withIdentifier: "PaidAppsTableViewCell", for: indexPath) as! PaidAppsTableViewCell
            
            return cell
        }
        else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "TrendingAppsTableViewCell", for: indexPath) as! TrendingAppsTableViewCell
            
            return cell
        }
    
    }
    
}

