//
//  MusicTableViewCell.swift
//  MusicPlaylist
//
//  Created by Murat Merekov on 23.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit
import AVFoundation

class MusicTableViewCell: UITableViewCell {
    
    var songName: UILabel!
    var songAuthor: UILabel!
    var songImage: UIImageView!
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        songName = UILabel()
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.font = UIFont(name: "Helvetica-Bold", size: 18)
        contentView.addSubview(songName)
        
        songAuthor = UILabel()
        songAuthor.translatesAutoresizingMaskIntoConstraints = false
        songAuthor.font = UIFont(name: "Helvetica", size: 16)
        contentView.addSubview(songAuthor)
        
        songImage = UIImageView()
        songImage.translatesAutoresizingMaskIntoConstraints = false
        songImage.contentMode = .scaleAspectFit
        contentView.addSubview(songImage)
        
        
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            songImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            songImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            songImage.heightAnchor.constraint(equalToConstant: 59),
            songImage.widthAnchor.constraint(equalToConstant: 59)
        ])
        NSLayoutConstraint.activate([
            songName.leadingAnchor.constraint(equalTo: songImage.trailingAnchor, constant: 12),
            songName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            songImage.heightAnchor.constraint(equalToConstant: 18),
        ])
        
        NSLayoutConstraint.activate([
            songAuthor.leadingAnchor.constraint(equalTo: songImage.trailingAnchor, constant: 12),
            songAuthor.topAnchor.constraint(equalTo: songName.bottomAnchor,constant: 4),
            songAuthor.heightAnchor.constraint(equalToConstant: 18)
            
        ])
       
    }
    
    func configure(_ music: Musicinfo){
        songName.text = music.songName
        songAuthor.text = music.authorName
        songImage.image = UIImage(named: music.imageName) 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
