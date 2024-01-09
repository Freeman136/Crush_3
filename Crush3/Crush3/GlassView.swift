//
//  GlassClass.swift
//  Crush3
//
//  Created by Andrew on 25.10.2023.
//


import SwiftUI

struct GlassViewRender: UIViewRepresentable {
    var removeEffects = false
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let subLayer = uiView.layer.sublayers?.first {
                if removeEffects {
                    subLayer.filters?.removeAll()
                } else {
                    subLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"
                    })
                }
            }
        }
    }
}
