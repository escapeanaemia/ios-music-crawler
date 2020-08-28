//
//  PlaylistVO.swift
//  MusicCrawler
//
//  Created by Andrew Han on 2020/08/28.
//  Copyright © 2020 escapeanaemia. All rights reserved.
//

import Foundation

class ChartVO{
    var year : Int = 0
    var playList : [MusicVO]?
    
    
}

class MusicVO {
    var title:String?
    var artist:String?
    var album:String?
    var imageURL:String?
    
    init(title:String, artist:String?, album:String, imageURL:String?) {
        self.title = title
        self.artist = artist
        self.album = album
        self.imageURL = imageURL
    }
}
