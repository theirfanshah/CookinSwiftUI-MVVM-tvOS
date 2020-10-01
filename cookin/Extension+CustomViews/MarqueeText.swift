//
//  MarqueeText.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct MarqueeText : View {
    @State var text = ""
    @State private var animate = false
    private let animationOne = Animation.linear(duration: 8).delay(2).repeatForever(autoreverses: false)
    
    var body : some View {
        let stringWidth = text.widthOfString(usingFont: UIFont.systemFont(ofSize: 35))
        return ZStack {
            GeometryReader { geometry in
                Text(self.text).lineLimit(1)
                    .font(.headline)
                    .offset(x: self.animate ? -stringWidth * 1.2 : 0)
                    .animation(self.animationOne)
                    .onAppear() {
                        if geometry.size.width < stringWidth {
                            self.animate = true
                        }
                }
                .fixedSize(horizontal: true, vertical: false)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                if stringWidth > 350 {
                    Text(self.text).lineLimit(1)
                        .font(.headline)
                        .offset(x: self.animate ? 0 : stringWidth * 1.2)
                        .animation(self.animationOne)
                        .fixedSize(horizontal: true, vertical: false)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }
            }
        }
    }
}

extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

