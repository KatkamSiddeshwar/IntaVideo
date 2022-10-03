//
//  VideoCollectionCell.swift
//  InstaVideo
//
//  Created by Auriga on 29/09/22.
//

import UIKit
import AVFoundation

class VideoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var pauseButton: UIButton!
    
    var playerLayer = AVPlayerLayer()
    var player : AVPlayer?
    var isPlaying = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
