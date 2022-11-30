//
//  UIImageView + MaskCircle.swift
//  LearningTask-7.2
//
//  Created by Raul Ribeiro on 29/11/22.
//

import UIKit

extension UIImageView {
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true

       self.image = anyImage
      }
}
