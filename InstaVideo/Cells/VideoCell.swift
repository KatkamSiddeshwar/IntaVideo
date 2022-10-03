//
//  VideoCell.swift
//  InstaVideo
//
//  Created by Auriga on 30/09/22.
//

import UIKit
import AVFoundation

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var pauseButton: UIButton!
    
    var playerLayer = AVPlayerLayer()
    var player : AVPlayer?
    var isPlaying = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func pauseTapped(_ sender: Any) {
        if isPlaying {
            player?.pause()
            pauseButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player?.play()
            pauseButton.setImage(UIImage(named: "pause"), for: .normal)
        }
        isPlaying = !isPlaying
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
