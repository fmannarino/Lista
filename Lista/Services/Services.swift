//
//  Services.swift
//  Lista
//
//  Created by Felipe Mannarino on 02/05/2018.
//  Copyright © 2018 Felipe Mannarino. All rights reserved.
//

import Foundation

final class Services{
    
    class func getPhotosList(_ completion: @escaping ([Photos], NSError?) -> Void) {
        var photosList = [Photos]()
        
            do {
                let url = URL(string: Constants.JSONURL)
                let jsonData = try Data(contentsOf: url!)
                photosList = try JSONDecoder().decode([Photos].self, from: jsonData)
                completion(photosList, nil)
            } catch {
                print("Ocorreu um erro no JSON")
            }
    }
}
