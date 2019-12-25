//
//  resultModel.swift
//  codingExercise
//
//  Created by Ahsan Rizvi on 12/24/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import Foundation




struct resultModel1:Codable{
    
    var results: [Data]
    
    init(results: [Data]){
        self.results = results
        
    }
    
}
struct Data : Codable {
    var created_at: String = ""
    var price:String = ""
    var name:String = ""
    var uid:String = ""
    var image_ids : [String]
    var image_urls : [String]
    var image_urls_thumbnails : [String]
    
    init(created_at: String,price:String,name:String,uid:String,image_ids:[String],image_urls:[String],image_urls_thumbnails:[String]) {
        self.created_at = created_at
        self.price = price
        self.name = name
        self.uid = uid
        self.image_ids = image_ids
        self.image_urls = image_urls
        self.image_urls_thumbnails = image_urls_thumbnails
        
    }

}
