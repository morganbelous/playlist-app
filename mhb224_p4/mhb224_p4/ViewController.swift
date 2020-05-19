//
//  ViewController.swift
//  mhb224_p4
//
//  Created by Morgan Belous on 3/19/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

protocol ChangeSongDetailsDelegate: class{
    func  textFieldDetailsChanged(to newSong: String, newArtist: String, newAlbum: String)
}

protocol AddSongDelegate: class{
    func  newSongAdded(to addedSong: String, addedArtist: String, addedAlbum: String)
}

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var songs: [Song]!
    var addSongButton: UIBarButtonItem!
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Songs"
        view.backgroundColor = .white
        
        let song0 = Song(name: "Don't Stop Me Now", artist: "Queen", album: "Jazz", albumImage: .queen)
        let song1 = Song(name: "7 rings", artist: "Ariana Grande", album: "thank u, next", albumImage: .arianaGrande)
        let song2 = Song(name: "XO", artist: "Beyonce", album: "BEYONCE", albumImage: .beyonce)
        let song3 = Song(name: "Psycho", artist: "Post Malone", album: "beerbongs & bentleys", albumImage: .postMalone)
        let song4 = Song(name: "All Night", artist: "Chance the Rapper", album: "Coloring Book", albumImage: .chance)
        let song5 = Song(name: "Ultralight Beam", artist: "Kanye West", album: "The Life of Pablo", albumImage: .kanye)
        let song6 = Song(name: "Young Dumb & Broke", artist: "Khalid", album: "American Teen", albumImage: .khalid)
        let song7 = Song(name: "Shotgun", artist: "George Ezra", album: "Staying at Tamara's", albumImage: .george)
        let song8 = Song(name: "Better Not", artist: "Louis the Child & Wafia", album: "Kids at Play", albumImage: .louis)
        let song9 = Song(name: "The Weekend", artist: "SZA", album: "Ctrl", albumImage: .sza)
        songs = [song0, song1, song2, song3, song4, song5, song6, song7, song8, song9]
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        addSongButton = UIBarButtonItem(title: "Add Song", style: .plain, target: self, action: #selector(pushAddSongViewController))
        self.navigationItem.rightBarButtonItem = self.addSongButton
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushDetailsViewController() {
        let indexPath = self.tableView.indexPathForSelectedRow
        let song = songs[indexPath!.row]
        let detailsViewController = DetailsViewController(placeHolderSong: song.name, placeHolderArtist: song.artist, placeHolderAlbum: song.album)
        detailsViewController.delegate = self
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    @objc func pushAddSongViewController(){
    let addSongViewController = AddSongViewController(placeHolderSong: "", placeHolderArtist: "", placeHolderAlbum: "")
    addSongViewController.delegate = self
    navigationController?.pushViewController(addSongViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            songs.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    /// - Tell the table view how many rows should be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    /// - Tell the table view what cell to display for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as!
        SongTableViewCell
        let song = songs[indexPath.row]
        cell.configure(for: song)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    /// Tell the table view what height to use for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    /// Tell the table view what should happen if we select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushDetailsViewController()
    }
    
    /// Tell the table view what should happen if we deselect a row
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: ChangeSongDetailsDelegate {
    func textFieldDetailsChanged(to newSong: String, newArtist: String, newAlbum: String) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let song = songs[indexPath!.row]
        song.name = newSong
        song.artist = newArtist
        song.album = newAlbum
        tableView.reloadData()
    }
}

extension ViewController: AddSongDelegate {
    func newSongAdded(to addedSong: String, addedArtist: String, addedAlbum: String) {
        let addedSong = Song(name: addedSong, artist: addedArtist, album: addedAlbum, albumImage: .none)
        songs.append(addedSong)
        tableView.reloadData()
    }
}

