//
//  ViewController.swift
//  Temp
//
//  Created by Тимур Куашев on 20.08.2023.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    private let imageCover: UILabel = UILabel()
    private let imageCoverVal: UILabel = UILabel()
    
    private let episodeName: UILabel = UILabel()
    private let episodeNameVal: UILabel = UILabel()
    
    private let channelName: UILabel = UILabel()
    private let channelNameVal: UILabel = UILabel()
    
    private let durTime: UILabel = UILabel()
    private let durTimeVal: UILabel = UILabel()
    
    private let curPlayTime: UILabel = UILabel()
    private let curPlayTimeVal: UILabel = UILabel()
    
    private let mainStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .equalSpacing
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configUI()
        
        // Here we always get nil
        let sysMP: MPMusicPlayerController & MPSystemMusicPlayerController = MPMusicPlayerController.systemMusicPlayer
        let currItem: MPMediaItem? = sysMP.nowPlayingItem
        imageCoverVal.text = currItem?.artwork?.image(at: .zero) == nil ? "nil" : "exist"
        episodeNameVal.text = currItem?.title ?? "nil"
        channelNameVal.text = currItem?.artist ?? "nil"
        durTimeVal.text = currItem?.playbackDuration.description ?? "nil"
        curPlayTimeVal.text = sysMP.currentPlaybackTime.description
    }
    
    func configUI() {
        config(lbl: imageCover)
        imageCover.text = "Image Cover"
        config(lbl:imageCoverVal, isVal: true)
        createStack(forLbls: [imageCover, imageCoverVal])
        
        config(lbl: episodeName)
        episodeName.text = "Episode Name"
        config(lbl:episodeNameVal, isVal: true)
        createStack(forLbls: [episodeName, episodeNameVal])
        
        config(lbl: channelName)
        channelName.text = "Channel Name"
        config(lbl: channelNameVal, isVal: true)
        createStack(forLbls: [channelName, channelNameVal])
        
        config(lbl: durTime)
        durTime.text = "Total Duration Time"
        config(lbl: durTimeVal, isVal: true)
        createStack(forLbls: [durTime, durTimeVal])
        
        config(lbl: curPlayTime)
        curPlayTime.text = "Current Playback Time"
        config(lbl:curPlayTimeVal, isVal: true)
        createStack(forLbls: [curPlayTime, curPlayTimeVal])
        
        mainStack.attachTo(view: self.view, toSides: [.left, .right])
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            mainStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
    }
    
    func createStack(forLbls lbls: [UILabel]) {
        let s = UIStackView(arrangedSubviews: lbls)
        s.axis = .vertical
        s.alignment = .center
        s.spacing = 14
        
        mainStack.addArrangedSubview(s)
    }

    func config(lbl: UILabel, isVal: Bool = false) {
        let size: CGFloat = isVal ? 14 : 16
        lbl.font = UIFont.systemFont(ofSize: size)
        lbl.textColor = isVal ? .red : .black
    }

}

