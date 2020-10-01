//
//  TextView.swift
//  cooker
//
//  Created by Irfan Shah on 22/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {

    var text: String
//    @Binding var textStyle: UIFont.TextStyle

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()

//        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value:UITouch.TouchType.indirect.rawValue)]
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
//        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}
