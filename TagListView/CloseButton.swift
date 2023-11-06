//
//  CloseButton.swift
//  TagListViewDemo
//
//  Created by Benjamin Wu on 2/11/16.
//  Copyright © 2016 Ela. All rights reserved.
//

import UIKit

internal class CloseButton: UIButton {

    var iconSize: CGFloat = 10 // İkon boyutu olarak kullanılacak
    var lineWidth: CGFloat = 10
    var lineColor: UIColor = .white // "X" işareti için beyaz renk
    var circleColor: UIColor = UIColor(red: 12/255, green: 33/255, blue: 58/255, alpha: 1) // Arka plan daire rengi

    weak var tagView: TagView?

    override func draw(_ rect: CGRect) {
        // UIImage oluşturuyoruz.
        let iconImage = createCircleWithXIcon(iconSize: CGSize(width: rect.width, height: rect.height))
        // UIImage'ı UIButton üzerinde çiziyoruz.
        iconImage.draw(in: rect)
    }
    
    func createCircleWithXIcon(iconSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: iconSize)
        return renderer.image { ctx in
            // Arka plan daireyi çiziyoruz.
            let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height))
            circleColor.setFill()
            circlePath.fill()

            // "X" işaretini çiziyoruz.
            let xPath = UIBezierPath()
            xPath.lineWidth = lineWidth

            // "X" işaretinin merkezini hesaplıyoruz.
            let center = CGPoint(x: iconSize.width / 2, y: iconSize.height / 2)
            let xMarkSize: CGFloat = 5.5
            
            // "X" işaretinin noktalarını hesaplıyoruz.
            let topLeft = CGPoint(x: center.x - xMarkSize / 2, y: center.y - xMarkSize / 2)
            let topRight = CGPoint(x: center.x + xMarkSize / 2, y: center.y - xMarkSize / 2)
            let bottomLeft = CGPoint(x: center.x - xMarkSize / 2, y: center.y + xMarkSize / 2)
            let bottomRight = CGPoint(x: center.x + xMarkSize / 2, y: center.y + xMarkSize / 2)
            
            // Sol üstten sağ alta çizgi
            xPath.move(to: topLeft)
            xPath.addLine(to: bottomRight)
            
            // Sağ üstten sol alta çizgi
            xPath.move(to: topRight)
            xPath.addLine(to: bottomLeft)

            // "X" işaretini beyaz renkle çiziyoruz.
            lineColor.setStroke()
            xPath.stroke()
        }
    }
}
