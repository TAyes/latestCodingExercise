//
//  searchController.swift
//  codingExercise
//
//  Created by Ahsan Rizvi on 12/24/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit


class searchController: UIViewController {
    
    //MArk:- Outlets
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
 

    //MArk:- Variables
    var codablemodel = [Data]()
    var filteritem=[Data]()
    var swiftArray = [String]()
    private let urlString : String = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
   
    
    //MArk:- view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        resultTableView.delegate = self
        resultTableView.dataSource = self
        self.resultShow()
        
    }

    
    
    //MArk:- url Session function 
    func resultShow () {
   
        guard let URL = URL(string: urlString) else {
        return
        }
        print(URL)
        let request = URLRequest(url: URL)
        print(request)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void  in
        if let error = error {
            print(error)
        return
        
     
        }
        // Parse JSON data
        if let data = data {
            
            do{
                let downloadmodel = try JSONDecoder().decode(resultModel1.self, from: data)
                self.codablemodel = downloadmodel.results
            }
            catch{
                print("Error While fetching data")
            }
   
        self.filteritem = self.codablemodel
            DispatchQueue.main.async {
                
               self.resultTableView.reloadData()
            }
            
        }
        })
        
        task.resume()
    }

}



extension searchController: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        guard !searchText.isEmpty else {
            self.filteritem = self.codablemodel
            self.resultTableView.reloadData()
            return        }
        self.filteritem = self.codablemodel.filter{term  -> Bool in
            term.name.lowercased().contains(searchText.lowercased())}
     
        DispatchQueue.main.async {
            self.resultTableView.reloadData()
        }
        
    }
}




extension searchController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.filteritem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SerchableCell
        
        cell.titleLbl.text = self.filteritem[indexPath.row].name
        self.swiftArray = self.filteritem[indexPath.row].image_urls_thumbnails
        
        
        
        cell.thumbnail.loadImageUsingCache(withUrl: self.swiftArray[0])
         
        
        cell.priceLbl.text = self.filteritem[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         
        let initialViewController = (storyboard?.instantiateViewController(withIdentifier: "DetailViewController"))  as? DetailViewController
        
      
        
        initialViewController?.price = self.filteritem[indexPath.row].price
        initialViewController?.name = self.filteritem[indexPath.row].name
        initialViewController?.imageId = self.filteritem[indexPath.row].image_ids[0]

        
        DispatchQueue.main.async {
            let thmbnail = self.filteritem[indexPath.row].image_urls_thumbnails[0]
            initialViewController?.itemthumnailImgView?.loadImageUsingCache(withUrl: thmbnail)
            let imagestring =  self.filteritem[indexPath.row].image_urls[0]
            initialViewController?.itemfullimageview?.loadImageUsingCache(withUrl: imagestring)        }
        
        initialViewController?.date = self.filteritem[indexPath.row].created_at
        initialViewController?.uId = self.filteritem[indexPath.row].uid
        navigationController?.pushViewController(initialViewController!, animated: true)
    
}
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            
        }
    }
}


let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }

        }).resume()
    }
}
