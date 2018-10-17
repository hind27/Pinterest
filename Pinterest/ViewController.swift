//
//  ViewController.swift
//  Test Layout
//
//  Created by hind on 10/8/18.
//  Copyright © 2018 hind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    let images = [#imageLiteral(resourceName: "image-1"),#imageLiteral(resourceName: "image-2"),#imageLiteral(resourceName: "image-3"),#imageLiteral(resourceName: "image-4"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recree
    }
    
}
// MARK: - Flow layout delegate
extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.item]
        let height = image.size.height
        
        return height
    }

}


// MARK: Data source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView?.image = image
        return cell
    }
}



