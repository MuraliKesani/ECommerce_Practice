//
//  TrendingTableViewCell.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class TrendingAppsTableViewCell: UITableViewCell {

    @IBOutlet var trendingAppsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        trendingAppsCollectionView.delegate = self
        trendingAppsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TrendingAppsTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "TendingAppsCollectionViewCell", for: indexPath) as! TendingAppsCollectionViewCell
        item.appImage.image = UIImage(named: "Iphone XR")
        item.appName.text = "Iphone XR"
        return item
    }
    
    
}
