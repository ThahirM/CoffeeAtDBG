//
//  Track.swift
//  SwiftDemo
//
//  Created by Thahir Maheen on 27/02/15.
//  Copyright (c) 2015 Digital Brand Group. All rights reserved.
//

import Foundation

class Track {
    
    var trackName: String?
    var trackCollectionName: String?
    var trackImage: String?
    
    init(trackData: NSDictionary) {
        
        // initialize data
        trackName = trackData["trackName"] as? String
        trackCollectionName = trackData["collectionName"] as? String
        trackImage = trackData["artworkUrl100"] as? String
        
    }
    
    class func fetchTracks(searchKey: String, completionHandler: [Track] -> Void) {
        
        // configure the url
        let stringUrl = "http://itunes.apple.com/search?term=\(searchKey)&media=music"
        
        // fetch data from service
        ParseEngine.fetchData(stringUrl) { (data: NSDictionary) in
            
            // create tracks
            let tracksData = data["results"] as [NSDictionary]
            let tracks = tracksData.map { Track(trackData: $0) }
            
            // callback on main thread
            dispatch_async(dispatch_get_main_queue()) {
                completionHandler(tracks)
            }
        }
    }
}