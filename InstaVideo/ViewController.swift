//
//  ViewController.swift
//  InstaVideo
//
//  Created by Auriga on 29/09/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var tableView: UITableView!
    
    var presentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//        let nibname = UINib(nibName: "VideoCell", bundle: nil)
//        tableView.register(nibname, forCellReuseIdentifier: "videoCell")
        let nibname = UINib(nibName: "VideoCollectionCell", bundle: nil)
        collectionView.register(nibname, forCellWithReuseIdentifier: "videoCell")
    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoCell
//        let videoURL = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4")
//        cell.player = AVPlayer(url: videoURL!)
//        cell.playerLayer = AVPlayerLayer(player: cell.player)
//        cell.playerLayer.frame = tableView.bounds
//        cell.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        cell.videoView.layer.addSublayer(cell.playerLayer)
//        cell.player!.play()
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.size.height
//    }

//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let i = IndexPath(row: indexPath.row - 1, section: 0)
//        guard let cell = tableView.cellForRow(at: i) as? VideoCell else { return }
//        cell.player!.pause()
//    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionCell
        if cell.player != nil {
            cell.player!.play()
        }else {
//            let videoURL = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4")
            let videoURL = URL(string: "https://www.dropbox.com/s/0x2ke57h7wv49ll/Sample_512x288.mp4")
            cell.player = AVPlayer(url: videoURL!)
            cell.playerLayer = AVPlayerLayer(player: cell.player)
            cell.playerLayer.frame = collectionView.bounds
            cell.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            cell.videoView.layer.addSublayer(cell.playerLayer)
            cell.player!.play()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let i = IndexPath(row: indexPath.row - 1, section: 0)
        guard let cell = collectionView.cellForItem(at: i) as? VideoCollectionCell else { return }
        cell.player!.pause()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageFloat = (scrollView.contentOffset.y / scrollView.frame.size.height)
        let pageInt = Int(round(pageFloat))
        if pageInt != presentPage {
            presentPage = pageInt

        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: collectionView.frame.size.height)
    }

}

