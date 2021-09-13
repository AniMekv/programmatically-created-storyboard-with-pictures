//
//  ViewController.swift
//  AniMekvabidze13
//
//  Created by Mac User on 5/17/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
 
       var myImages: [UIImage] = [
        UIImage(named: "animal1")!,
        UIImage(named: "animal2")!,
        UIImage(named: "animal3")!,
        UIImage(named: "animal4")!,
    ]

    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-3, height: (view.frame.size.height/2)-3)

        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView  else {
            return
        }

        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame  = view.bounds

    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.myImageView.layer.borderWidth = 1
        cell.myImageView.layer.masksToBounds = false
        cell.myImageView.layer.borderColor = UIColor.black.cgColor
        cell.myImageView.layer.cornerRadius = cell.myImageView.frame.height/2
        cell.myImageView.clipsToBounds = true
        cell.myImageView.image = myImages[indexPath.row]

        return cell
                                                      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = GSImageInfo(image: myImages[indexPath.row], imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        imageViewer.dismissCompletion = {
            "dismiss called"
        }
        present(imageViewer, animated: true)
        
        
        
    }

    
}


