//
//  AlbumViewController.swift
//  Lista
//
//  Created by Felipe Mannarino on 04/05/2018.
//  Copyright © 2018 Felipe Mannarino. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    
    var currentAlbum: Photos?
    
    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var albumImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lbltitle.text = currentAlbum?.title
        let imageData: NSData = NSData(contentsOf: URL(string: (self.currentAlbum?.url)!)!)!
        let image = UIImage(data: imageData as Data)
        self.albumImage.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
