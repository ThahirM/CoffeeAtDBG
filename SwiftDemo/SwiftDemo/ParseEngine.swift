//
//  ParseEngine.swift
//  SwiftDemo
//
//  Created by Thahir Maheen on 27/02/15.
//  Copyright (c) 2015 Digital Brand Group. All rights reserved.
//

import Foundation

class ParseEngine {
    
    class func fetchData(stringUrl: String!, completionHandler: NSDictionary -> Void) {
        
        // create the url
        let url = NSURL(string: stringUrl)!
        
        // download data
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData!, response: NSURLResponse!, error: NSError?) in
            
            // handle errors
            if let error = error {
                println(error.localizedDescription)
                return
            }
            
            // parse data
            var jsonError: NSError?
            if let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary {
                
                // handle parsing errors
                if let error = jsonError {
                    println(error.localizedDescription)
                    return
                }
                
                // return the result
                completionHandler(jsonData)
            }
        }.resume()
    }
}