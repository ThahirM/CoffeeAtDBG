//
//  ListViewController.swift
//  SwiftDemo
//
//  Created by Thahir Maheen on 27/02/15.
//  Copyright (c) 2015 Digital Brand Group. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UISearchBarDelegate {
    
    var tracks: [Track]? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return tracks?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("kListCell", forIndexPath: indexPath) as ListViewCell
        
        // set the track for the cell
        cell.track = tracks![indexPath.row]
        
        return cell
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        // hide the keyboard
        searchBar.resignFirstResponder()
        
        // fetch tracks based on the search key
        Track.fetchTracks(searchBar.text) { (tracks: [Track]) in
            self.tracks = tracks
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        // hide the keyboard
        searchBar.resignFirstResponder()
    }
}
