//
//  ViewController.swift
//  MusicPlaylist
//
//  Created by Murat Merekov on 22.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var tableView: UITableView!
    var musics: [Musicinfo]!
    var audioPlayer = AVAudioPlayer()
    var toggle: Bool = false
      var check: Int = -1
    
    let reuseIdentifier = "musicCellReuse"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Songs"
        view.backgroundColor = .white
        
        let tantra = Musicinfo(songName: "Minor",
                               authorName: "Miyagi & Andy Panda",
                               imageName: "tantra",
                               audioName: "MiyaGi & Andy Panda - Minor")
        
        let cadilac = Musicinfo(songName: "Cadilac",
                                authorName: "MORGENSTERN, Элджей",
                                imageName: "cadilac",
                                audioName: "MORGENSHTERN, Элджей - Кадиллак")
        
        let bilyache = Musicinfo(songName: "Bellyache",
                                 authorName: "Billie Eilish",
                                 imageName: "billyache",
                                 audioName: "Billie Eilish - Bellyache")
        
        let papa = Musicinfo(songName: "Papaoutai",
                             authorName: "Stromae",
                             imageName: "papa",
                             audioName: "Stromae - Papaoutai")
        
        let time = Musicinfo(songName: "Это любовь",
                             authorName: "Скриптонит",
                             imageName: "time",
                             audioName: "Скриптонит - Это Любовь")
        
        let fireman = Musicinfo(songName: "Fireman",
                                authorName: "Miyagi & Andy Panda",
                                imageName: "fireman",
                                audioName: "MiyaGi & Эндшпиль - Fire Man")
        
        let kaif = Musicinfo(songName: "Ты мой кайф",
                             authorName: "Джаро & Ханза",
                             imageName: "kaif",
                             audioName: "Джаро & Ханза - Ты Мой Кайф")
        
        musics = [tantra,cadilac,bilyache,papa,time,fireman,kaif]
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MusicTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setupConstraints()
    }
   
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell =  tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MusicTableViewCell
        let song = musics[indexPath.row]
        cell.configure(song)
       
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let song = musics[indexPath.row]
        
        if check != indexPath.row{
            audioPlayer.stop()
        let sound = Bundle.main.path(forResource: song.audioName, ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print("error")
        }
            
            
            audioPlayer.play()
        let modalViewController = ModalViewController(song, audioPlayer)
             present(modalViewController, animated: true, completion: nil)
        }
        
        check = indexPath.row
       
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    func updateCount(){
      if let list = tableView.indexPathsForSelectedRows {
        print("count of click: \(list.count)")
      }
    }

}
