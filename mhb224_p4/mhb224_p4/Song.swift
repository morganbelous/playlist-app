//
//  Song.swift
//  mhb224_p4
//
//  Created by Morgan Belous on 3/19/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import Foundation

enum ImageEnum {
    case queen
    case arianaGrande
    case beyonce
    case postMalone
    case chance
    case kanye
    case khalid
    case george
    case louis
    case sza
    case none
}

class Song {
    
    var name: String
    var artist: String
    var album: String
    var albumImage: ImageEnum
    
    init(name: String, artist: String, album: String, albumImage: ImageEnum) {
        self.name = name
        self.artist = artist
        self.album = album
        self.albumImage = albumImage
    }  
}
