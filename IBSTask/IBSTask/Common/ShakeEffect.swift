//
//  ShakeEffect.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 03/10/2022.
//

import SwiftUI

struct ShakeEffect : GeometryEffect {
    var travelDistance : CGFloat = 6
    var numOfShake : CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * numOfShake), y: 0))
    }
}
