//
//  ViewController.swift
//  Slideshowapp
//
//  Created by 八木由佳 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像ファイル
    let fileName = ["book_gijutsusyo_it_set.png", "computer_cloud_system.png", "computer_girl.png", "media_digital.png"]
    var imageIndex = 0
    
    @IBOutlet weak var imageFileView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playStopButton: UIButton!
    
    var playFlg = false
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageFileView.contentMode = .scaleAspectFit
        imageFileView.image = UIImage(named: fileName[imageIndex])
        imageFileView.center = self.view.center
        self.view.addSubview(imageFileView)
    }
    
    // 進むボタンが押下されたとき
    @IBAction func forwardAction(_ sender: Any) {
        if imageIndex + 1 == fileName.count {
            imageIndex = 0
        }
        else {
            imageIndex = imageIndex + 1
        }
        imageFileView.image = UIImage(named: fileName[imageIndex])
    }
    
    // 戻るボタンが押下されたとき
    @IBAction func backAction(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = fileName.count - 1
        }
        else {
            imageIndex = imageIndex - 1
        }
        imageFileView.image = UIImage(named: fileName[imageIndex])
    }

    // 再生/停止ボタンが押下されたとき
    @IBAction func playStopAction(_ sender: Any) {
        
        if !playFlg {
            playAction()
        }
        else {
            stopAction()
        }
    }
    
    // スライドショーを再生する
    @objc func playAction() {
        // 進むボタンと戻るボタンを押下不可に
        forwardButton.isEnabled = false
        backButton.isEnabled = false
        // 2秒毎にforwardAction()を実行
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(forwardAction(_:)), userInfo: nil, repeats: true)
        // 再生中フラグをtrueにする
        playFlg = true
        // ボタンの表示を「停止」にする
        playStopButton.setTitle("停止", for: .normal)
    }
    
    // スライドショーを停止する
    @objc func stopAction() {
        // 進むボタンと戻るボタンを押下可能に
        forwardButton.isEnabled = true
        backButton.isEnabled = true
        // タイマーを破棄
        timer.invalidate()
        // 再生フラグをfalseにする
        playFlg = false
        // ボタンの表示を「再生」にする
        playStopButton.setTitle("再生", for: .normal)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        
        zoomViewController.height = imageFileView.frame.height
        zoomViewController.width = imageFileView.frame.width
        zoomViewController.zoomFileName = fileName[imageIndex]
        
        if playFlg {
            stopAction()
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
        
}
