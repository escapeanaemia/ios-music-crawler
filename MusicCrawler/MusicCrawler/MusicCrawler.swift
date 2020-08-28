//
//  MusicCrawler.swift
//  MusicCrawler
//
//  Created by Andrew Han on 2020/08/28.
//  Copyright © 2020 escapeanaemia. All rights reserved.
//

import Foundation
import SwiftSoup

class MusicCralwer{
    static func fetchHTMLParsingResultWill() -> Bool{
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        let urlAddress = "https://www.genie.co.kr/chart/musicHistory?year=2017&category=0"
        
        guard let url = URL(string: urlAddress) else { return  false}
        do{
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)

            let getCategory : Elements = try doc.select("div#wrap-main")
                .select("div#wrap-body")
                .select("div#body-content")
                .select("div.songlist-box")
                .select("div.music-list-wrap")
                .select("table.list-wrap")
                .select("tr.list")
                .select("td.info")
                .select("a.artist")
            for element in getCategory.array(){
                debugPrint("-- \(try element.text())")
            }
            
            return true
        }catch let error{
            return false
        }
        
        return false
    }
}
