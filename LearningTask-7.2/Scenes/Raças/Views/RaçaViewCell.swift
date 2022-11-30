//
//  RaçaViewCell.swift
//  LearningTask-7.2
//
//  Created by Raul Ribeiro on 29/11/22.
//

import UIKit

class RaçaViewCell: UICollectionViewCell {
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    var raça: Raça? {
        didSet {
            guard let raça = raça else { return }
            
            nomeLabel.text = raça.nome
            
            let fotoCatioro: UIImage? = UIImage(named: raça.nome)
            
            guard let fotoCatioro = fotoCatioro else {
                fotoImageView.image = UIImage(named: "")
                return
            }
            
            fotoImageView.image = fotoCatioro
            fotoImageView.maskCircle(anyImage: fotoCatioro)
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        layoutAttributes.size.height = size.height
        
        setNeedsLayout()
        return layoutAttributes
    }
}
