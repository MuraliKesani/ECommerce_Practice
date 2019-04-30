//
//  FreeApsTableViewCell.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class FreeApsTableViewCell: UITableViewCell {
    
    @IBOutlet var freeAppsCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        freeAppsCollectionView.delegate = self
        freeAppsCollectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
extension FreeApsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "FreeAppsCollectionViewCell", for: indexPath) as! FreeAppsCollectionViewCell
        item.appImage.image = UIImage(named: "iphone 6s")
        item.appName.text = "iphone 6s"
        return item
    }
    
    
}
