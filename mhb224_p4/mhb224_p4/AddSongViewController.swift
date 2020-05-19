//
//  AddSongViewController.swift
//  mhb224_p4
//
//  Created by Morgan Belous on 3/24/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

class AddSongViewController: UIViewController {
    var songLabel: UILabel!
    var songText: UITextField!
    var artistLabel: UILabel!
    var artistText: UITextField!
    var albumLabel: UILabel!
    var albumText: UITextField!
    var saveButton: UIBarButtonItem!
    
    var placeHolderSong: String
    var placeHolderArtist: String
    var placeHolderAlbum: String
    
    
    weak var delegate: AddSongDelegate?
    
    init(placeHolderSong: String, placeHolderArtist: String, placeHolderAlbum: String){
        self.placeHolderSong = placeHolderSong
        self.placeHolderArtist = placeHolderArtist
        self.placeHolderAlbum = placeHolderAlbum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add Song"
        
        songLabel = UILabel()
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.text = "Song:"
        view.addSubview(songLabel)
        
        songText = UITextField()
        songText.translatesAutoresizingMaskIntoConstraints = false
        songText.borderStyle = .roundedRect
        songText.clearsOnBeginEditing = true
        view.addSubview(songText)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.text = "Artist:"
        view.addSubview(artistLabel)
        
        artistText = UITextField()
        artistText.translatesAutoresizingMaskIntoConstraints = false
        artistText.borderStyle = .roundedRect
        //artistText.text = placeHolderArtist
        artistText.clearsOnBeginEditing = true
        view.addSubview(artistText)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.text = "Album:"
        view.addSubview(albumLabel)
        
        albumText = UITextField()
        albumText.translatesAutoresizingMaskIntoConstraints = false
        albumText.borderStyle = .roundedRect
        //albumText.text = placeHolderAlbum
        albumText.clearsOnBeginEditing = true
        view.addSubview(albumText)
        
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(dismissAddSongViewControllerAndSaveText))
        self.navigationItem.rightBarButtonItem = self.saveButton
        
        saveButton.action = #selector(dismissAddSongViewControllerAndSaveText(sender:))
        
        setupConstraints()
        
        
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            songLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
            ])
        
        
        NSLayoutConstraint.activate([
            songText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45),
            songText.centerYAnchor.constraint(equalTo: songLabel.centerYAnchor),
            songText.heightAnchor.constraint(equalToConstant: 30),
            songText.widthAnchor.constraint(equalToConstant: 225)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            artistLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
            ])
        
        NSLayoutConstraint.activate([
            artistText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45),
            artistText.centerYAnchor.constraint(equalTo: artistLabel.centerYAnchor),
            artistText.heightAnchor.constraint(equalToConstant: 30),
            artistText.widthAnchor.constraint(equalToConstant: 225)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 125),
            albumLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65),
            ])
        
        NSLayoutConstraint.activate([
            albumText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45),
            albumText.centerYAnchor.constraint(equalTo: albumLabel.centerYAnchor),
            albumText.heightAnchor.constraint(equalToConstant: 30),
            albumText.widthAnchor.constraint(equalToConstant: 225)
            ])
    }
    
    @objc func dismissAddSongViewControllerAndSaveText(sender: UIBarButtonItem){
        if let song = songText.text, let artist = artistText.text, let album = albumText.text {
            delegate?.newSongAdded(to: song, addedArtist: artist, addedAlbum: album)
        self.navigationController?.popViewController(animated: true)
        }
    }
}
