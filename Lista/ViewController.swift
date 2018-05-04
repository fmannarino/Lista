//
//  ViewController.swift
//  Lista
//
//  Created by Felipe Mannarino on 28/04/2018.
//  Copyright © 2018 Felipe Mannarino. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var photosList = [Photos]()
    var refreshCtrl = UIRefreshControl()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.estimatedRowHeight = 188.0
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(UINib(nibName: "PhotosListTableViewCell", bundle:nil), forCellReuseIdentifier: "cellPhotosList")
        getPhotos()
        //print(photosList[0].title)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getPhotos() {
        refreshCtrl.beginRefreshing()
        Services.getPhotosList() { (photos, erro) in
            self.photosList = photos
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhotosList", for: indexPath) as! PhotosListTableViewCell
        cell.lbltitle.text = self.photosList[indexPath.row].title
        let imageData: NSData = NSData(contentsOf: URL(string: self.photosList[indexPath.row].thumbnailUrl!)!)!
        let image = UIImage(data: imageData as Data)
        cell.albumImage.image = image
        return cell
    }

}

