//
//  Extension+View.swift
//  SwiftUIBottomSheetExample
//
//  Created by Vitor Trimer on 13/12/22.
//

import SwiftUI

extension View {
    
    func blurredSheet<Content: View>(_ style: AnyShapeStyle, show: Binding<Bool>, onDismiss: @escaping()->(), @ViewBuilder content: @escaping()->Content) -> some View {
        self.sheet(isPresented: show, onDismiss: onDismiss) {
            content().background(RemoveBackgroundColor())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Rectangle()
                        .fill(style)
                        .ignoresSafeArea(.container, edges: .all)
                }
        }
    }
    
}

fileprivate struct RemoveBackgroundColor: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            uiView.superview?.superview?.backgroundColor = .clear
        }
    }
}
