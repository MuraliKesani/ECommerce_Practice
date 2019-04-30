//
//  FreeApsTableViewCell.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit
import SDWebImage

class FreeApsTableViewCell: UITableViewCell {
    
    @IBOutlet var freeAppsCollectionView: UICollectionView!
    
    var appsData:AppleApps?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        freeAppsCollectionView.delegate = self
        freeAppsCollectionView.dataSource = self
        dataFetching()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func dataFetching(){
        var url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/100/explicit.json")
        var URLReq = URLRequest(url: url!)
        URLSession.shared.dataTask(with: URLReq) { (data, response, err) in
            do{
                self.appsData = try JSONDecoder().decode(AppleApps.self, from: data!)
                DispatchQueue.main.async {
                    self.freeAppsCollectionView.reloadData()
 print("Something Went Wright")
                }
            }
            catch{
                print("Something Went Wrong")
            }
        }.resume()
    }
    
}


extension FreeApsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsData?.feed.title.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FreeAppsCollectionViewCell", for: indexPath) as! FreeAppsCollectionViewCell
        
        item.appName.text = appsData?.feed.results[indexPath.row].name
        
        let imgURL = URL(string: (appsData?.feed.results[indexPath.row].artworkUrl100)!)
        item.appImage.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
       
        
        return item
    }
    
    
}
