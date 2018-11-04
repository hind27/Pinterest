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
    let viewModel = ViewModel(client: UnsplashClient())
    let images = [#imageLiteral(resourceName: "image-1"),#imageLiteral(resourceName: "image-2"),#imageLiteral(resourceName: "image-3"),#imageLiteral(resourceName: "image-4"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     
        // Init view model
        viewModel.showLoading = {
            if self.viewModel.isLoading {
                self.activityIndicator.startAnimating()
                self.collectionView.alpha = 0.0
            } else {
                self.activityIndicator.stopAnimating()
                self.collectionView.alpha = 1.0
            }
        }
        
        viewModel.showError = { error in
            print(error)
        }
        
        viewModel.reloadData = {
            self.collectionView.reloadData()
        }
        
        viewModel.fetchPhotos()
        
    }
    
}
// MARK: - Flow layout delegate
extension ViewController: PinterestLayoutDelegate {
        func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
            let image = viewModel.cellViewModels[indexPath.item].image
            let height = image.size.height
            
            return height
        }
    }
    
    // MARK: Data source
extension ViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.cellViewModels.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
            
            let image = viewModel.cellViewModels[indexPath.item].image
            cell.imageView?.image = image
            
            return cell
        }
    }
    

