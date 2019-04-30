//
//  TrendingTableViewCell.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class TrendingAppsTableViewCell: UITableViewCell {
var appsData:AppleApps?
    @IBOutlet var trendingAppsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        trendingAppsCollectionView.delegate = self
        trendingAppsCollectionView.dataSource = self
        dataFetching()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func dataFetching(){
        var url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/new-apps-we-love/all/100/explicit.json")
        var URLReq = URLRequest(url: url!)
        URLSession.shared.dataTask(with: URLReq) { (data, response, err) in
            do{
                self.appsData = try JSONDecoder().decode(AppleApps.self, from: data!)
                DispatchQueue.main.async {
                    self.trendingAppsCollectionView.reloadData()
                    print("Something Went Wright")
                }
            }
            catch{
                print("Something Went Wrong")
            }
            }.resume()
    }
}
extension TrendingAppsTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsData?.feed.title.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "TendingAppsCollectionViewCell", for: indexPath) as! TendingAppsCollectionViewCell
        
        item.appName.text = appsData?.feed.results[indexPath.row].name
        
        let imgURL = URL(string: (appsData?.feed.results[indexPath.row].artworkUrl100)!)
        item.appImage.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
        
        
        return item
    }
    
    
}
