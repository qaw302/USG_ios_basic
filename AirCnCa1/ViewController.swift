//
//  ViewController.swift
//  AirCnCa1
//
//  Created by 박미정 on 2022/02/27.
//
// 최종

import UIKit

typealias Size = (w: Int, t: String, h: Int)

struct Coffee {
    var name: String
    var tumbnail: String
    var detailImage: [String]
    var price: Int
    var size: Size?
    var user: User
}

class User {
    var name: String
    var image: String?
    
    init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
}



class ViewController: UIViewController {
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var leftButton : UIButton!
    @IBOutlet weak var rightButton : UIButton!

    var coffeedata: Coffee?
    
    var currentImageIndex = 0
    var images: [String] = []
    
    
    func showImage(index: Int) {
        let imageName = images[index]
        imageView.image = UIImage(named: imageName)

        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    @IBAction func showPrevImage(_ sender: Any) {
        currentImageIndex -= 1
        self.showImage(index: currentImageIndex)
    }
        
    @IBAction func showNextImage(_ sender: Any) {
        currentImageIndex += 1
        self.showImage(index: currentImageIndex)
    }
        

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var likeButton : UIButton!
    

    @IBAction func handleLike(_ sender: Any) {
        likeButton.isSelected = !likeButton.isSelected
    }

    
    @IBOutlet weak var userImage : UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // 날짜 선택
    let dateFormatter = DateFormatter()

    @IBAction func handleDateChanged() {
        let dateStr = dateFormatter.string(from: datePicker.date)
            dateLabel.text = dateStr
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.isEnabled = false
        dateFormatter.dateStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let coffeedata = coffeedata {
            
            if let size = coffeedata.size {
                widthLabel.text = String(size.w)
                typeLabel.text = size.t
                heightLabel.text = String(size.w)
            }
            if let userimage = coffeedata.user.image {
                userImage.image = UIImage(named: userimage)
            }
            
            titleLabel.text = coffeedata.name
            userName.text = coffeedata.user.name
            priceLabel.text = String(coffeedata.price)
            images = coffeedata.detailImage
        }
        
        self.showImage(index: 0)
 

        handleDateChanged()
    }


}

