//
//  ZoomViewController.swift
//  Slideshowapp
//
//  Created by 八木由佳 on 2021/02/15.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImageView: UIImageView!
    
    var zoomFileName: String = ""    
    var width: CGFloat = 0
    var height: CGFloat = 0
    let sizeUp: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rect = CGRect(x: 0, y: 0, width: width*sizeUp, height: height*sizeUp)
        zoomImageView.frame = rect
        zoomImageView.contentMode = .scaleAspectFit
        zoomImageView.image = UIImage(named: zoomFileName)
        zoomImageView.center = self.view.center
        self.view.addSubview(zoomImageView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
