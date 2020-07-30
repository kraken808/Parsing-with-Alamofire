//
//  Model.swift
//  MusicPlaylist
//
//  Created by Murat Merekov on 22.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import Foundation

class Musicinfo {
    var songName: String
    var authorName: String
    var imageName: String
    var audioName: String
    
    init(songName:String, authorName: String, imageName: String, audioName: String) {
        self.authorName = authorName
        self.songName = songName
        self.imageName = imageName
        self.audioName = audioName
    }
}
