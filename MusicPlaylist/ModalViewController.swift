//
//  ModalViewController.swift
//  MusicPlaylist
//
//  Created by Murat Merekov on 24.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit
import AVFoundation

class ModalViewController: UIViewController {
    
    var playButton: UIButton!
    var nextButton: UIButton!
    var previousButton: UIButton!
    var songImage = UIImageView()
    var musicSlider = UISlider()
    var player: AVAudioPlayer!
    
    
    init(_ data: Musicinfo, _ player: AVAudioPlayer){
        songImage.image = UIImage(named: data.imageName)
        self.player = player
        musicSlider.maximumValue = Float(player.duration)
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        
        songImage.translatesAutoresizingMaskIntoConstraints = false
        songImage.contentMode = .scaleAspectFit
        view.addSubview(songImage)
        
       
        musicSlider.translatesAutoresizingMaskIntoConstraints = false
        musicSlider.addTarget(self, action: #selector(didSlider(_:)), for:.valueChanged )
        view.addSubview(musicSlider)
       Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        setupConstraints()
    }
    
func setupConstraints(){
    NSLayoutConstraint.activate([
        songImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        songImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        songImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        songImage.heightAnchor.constraint(equalToConstant: 400),
        songImage.widthAnchor.constraint(equalToConstant: 400),
        
        musicSlider.topAnchor.constraint(equalTo: songImage.bottomAnchor, constant: 15),
        musicSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        musicSlider.heightAnchor.constraint(equalToConstant: 15),
        musicSlider.widthAnchor.constraint(equalToConstant: 300)
        
    ])
}
    
    @objc func didSlider(_ slider: UISlider){
        player.stop()
        player.currentTime = TimeInterval(slider.value)
        player.prepareToPlay()
        player.play()
    }
    
    @objc func updateSlider(){
        musicSlider.value = Float(player.currentTime)
    }
 

}
