//
//  PaidAppsTableViewCell.swift
//  ECommerce_Practice
//
//  Created by Murali on 4/29/19.
//  Copyright © 2019 Murali. All rights reserved.
//

import UIKit

class PaidAppsTableViewCell: UITableViewCell {
    
    @IBOutlet var paidAppsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paidAppsCollectionView.delegate = self
        paidAppsCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension PaidAppsTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "PaidAppsCollectionViewCell", for: indexPath) as! PaidAppsCollectionViewCell
        item.appImage.image = UIImage(named: "Iphone X")
        item.appName.text = "Iphone X"
        return item
    }
    
    
}
