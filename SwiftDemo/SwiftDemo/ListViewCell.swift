//
//  ListViewCell.swift
//  SwiftDemo
//
//  Created by Thahir Maheen on 01/03/15.
//  Copyright (c) 2015 Digital Brand Group. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    var track: Track? = nil {
        didSet {
            textLabel?.text = track?.trackName
            detailTextLabel?.text = track?.trackCollectionName
            
            // add an image if there is a url
            if let imageURL = track?.trackImage {
                imageView?.sd_setImageWithURL(NSURL(string: imageURL), placeholderImage: UIImage(named: "Placeholder"), options: .ProgressiveDownload)
            }
        }
    }
}
