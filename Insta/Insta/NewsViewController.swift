//
//  NewsViewController.swift
//  Insta
//
//  Created by support on 29/01/24.
//

import UIKit

class NewsViewController: UIViewController {
    var networkHandler = NetworkHandler()
  
    var news : [Articles] = []
    
    @IBOutlet var newsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
        newsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        networkHandler.newsApiCall { val in
            print("Output: ", val)
            if val != nil {
                self.news = val!
                DispatchQueue.main.async {
                    self.newsCollectionView.reloadData()
                }
            }else{
                print("Fail")
            }
        }
    }
    
    
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let imageUrl = URL(string: news[indexPath.row].urlToImage!)
        if imageUrl != nil{
            let data = try? Data(contentsOf: imageUrl!)
            DispatchQueue.main.async {
                cell.newsImage.image = UIImage(data: data!)
            }
        }else{
            cell.newsImage.image = UIImage(systemName: "eye")
        }
        cell.newsHeadingLabel.text = news[indexPath.row].title
        cell.newsDescriptionLabel.text = news[indexPath.row].content
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 50, alpha: 1)
        return cell
    }


}

extension NewsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 700)
    }
}
