//
//  CommentCollectionViewCell.swift
//  JSONPlaceHolderApp
//
//  Created by Iván Díaz Molina on 16/2/21.
//  Copyright © 2021 IDIAZM. All rights reserved.
//

import UIKit
import IDIAZM

class CommentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var body: UILabel!
    
    static var cellIdentifier: String {
        return String(describing: CommentCollectionViewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        viewCell.layer.cornerRadius = 20.0
        viewCell.layer.borderWidth = 1.0
        viewCell.layer.borderColor = UIColor.gray.cgColor
        viewCell.layer.masksToBounds = true
        
        name.font = UIFont.boldSystemFont(ofSize: 16)
        body.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    func updateUI(model: PostDetails.Models.CommentCellModel) {
        name.text = model.comment?.email
        name.numberOfLines = 1
                
        body.text = model.comment?.body
        body.numberOfLines = 5
    }
}
