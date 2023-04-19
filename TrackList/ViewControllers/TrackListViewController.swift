//
//  TrackListViewController.swift
//  TrackList
//
//  Created by MikhaiL on 18.04.2023.
//

import UIKit

final class TrackListViewController: UITableViewController {
    
    private var trackList = Track.getTrack()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trackDetailVC = segue.destination as? TrackDetailsViewController else { return
        }
        trackDetailVC.track = sender as? Track
    }
}

// MARK: - UITableViewDataSource
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Track", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        var content = cell.defaultContentConfiguration()
        let track = trackList[indexPath.row]
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 20
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = trackList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: track)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let track = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(track, at: destinationIndexPath.row)
    }
}
