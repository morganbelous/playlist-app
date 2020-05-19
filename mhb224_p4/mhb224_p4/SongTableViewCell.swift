//
//  SongTableViewCell.swift
//  mhb224_p4
//
//  Created by Morgan Belous on 3/19/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var songLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var albumCoverView: UIImageView!
    
    let imagePadding: CGFloat = 100
    let artistPadding: CGFloat = 8
    let topPadding: CGFloat = 8
    let albumCoverWidth: CGFloat = 40
    let albumCoverHeight: CGFloat = 40
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songLabel = UILabel()
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(songLabel)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = UIFont.systemFont(ofSize: 12)
        artistLabel.textColor = .red
        contentView.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(albumLabel)
        
        albumCoverView = UIImageView()
        albumCoverView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverView.contentMode = .scaleAspectFit
        albumCoverView.isHidden = false
        albumCoverView.layer.cornerRadius = 8.0
        albumCoverView.clipsToBounds = true
        contentView.addSubview(albumCoverView)
        
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            songLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imagePadding),
            songLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topPadding),
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: songLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor),
            artistLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: artistPadding),
            albumLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor),
            albumLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            albumCoverView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            albumCoverView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            albumCoverView.heightAnchor.constraint(equalToConstant: albumCoverHeight),
            albumCoverView.widthAnchor.constraint(equalToConstant: albumCoverWidth)
            ])
    }
    
    func configure(for song: Song) {
        songLabel.text = song.name
        artistLabel.text = song.artist
        albumLabel.text = song.album
        setAlbumCover(albumImage: song.albumImage)
    }
    
    func setAlbumCover(albumImage: ImageEnum) {
        switch albumImage {
        case .queen:
            albumCoverView.image = UIImage(named: "queen")
        case .arianaGrande:
            albumCoverView.image = UIImage(named: "arianaGrande")
        case .beyonce:
            albumCoverView.image = UIImage(named: "beyonce")
        case .postMalone:
            albumCoverView.image = UIImage(named: "postMalone")
        case .chance:
            albumCoverView.image = UIImage(named: "chance")
        case .kanye:
            albumCoverView.image = UIImage(named: "kanye")
        case .khalid:
            albumCoverView.image = UIImage(named: "khalid")
        case .george:
            albumCoverView.image = UIImage(named: "george")
        case .louis:
            albumCoverView.image = UIImage(named: "louis")
        case .sza:
            albumCoverView.image = UIImage(named: "sza")
        case .none:
            albumCoverView.image = nil
        }
    }
}
