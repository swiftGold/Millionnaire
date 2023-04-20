//
//  ShadowModel.swift
//  HWTBAM
//
//  Created by Димаш Алтынбек on 11.02.2023.
//

import UIKit

class ShadowButton {
    func setShadowButton(_ sender: UIButton) {
        sender.layer.shadowColor = UIColor.black.cgColor
        sender.layer.shadowOffset = CGSize(width: 10, height: 10)
        sender.layer.masksToBounds = false
        sender.layer.shadowRadius = 2.0
        sender.layer.shadowOpacity = 0.5

    }
}
