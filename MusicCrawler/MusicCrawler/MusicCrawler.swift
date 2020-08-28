//
//  MusicCrawler.swift
//  MusicCrawler
//
//  Created by Andrew Han on 2020/08/28.
//  Copyright © 2020 escapeanaemia. All rights reserved.
//

import Foundation
import SwiftSoup

class BaseURL {
    
    private let BASE_URL = "https://www.genie.co.kr/chart/musicHistory"
    private var YEAR : Int?
    private var category: Int?
    private var page:Int?
    
    var FINAL_URL: String = ""
    
    init(year:Int, category:Int, page:Int? ) {
        self.YEAR = year
        self.category = category
        self.page = page
        
        FINAL_URL = BASE_URL
            + "?"
            + "year=\(year)"
            + "&category=\(category)"
        
        if let page = page { FINAL_URL = FINAL_URL + "&pg=\(page)"}
    }
}

class MusicCralwer{
    static func fetchHTMLParsingResultWill(urlString:String) -> Bool{
        
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        let urlAddress = urlString
        
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
                
                
            for element in getCategory.array(){
                let info = try element.select("td.info")
                let cover = try element.select("a.cover")
                
                debugPrint("---\(try info.select("a.artist").text())")
                debugPrint(" \(try info.select("a.title").text())")
                debugPrint(" \(try info.select("a.albumtitle").text())")
                debugPrint(" \(try cover.select("img").attr("src"))")
            }
            
            return true
        }catch let error{
            return false
        }
        
        return false
    }
}
