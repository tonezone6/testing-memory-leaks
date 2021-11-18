//
//  UsersView.swift
//  testing-uikit-memory-leaks
//
//

import SwiftUI

struct FirstView: View {
    var onAction: () -> Void = {}
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            
            Button("Second", action: onAction)
                .tint(.orange)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
