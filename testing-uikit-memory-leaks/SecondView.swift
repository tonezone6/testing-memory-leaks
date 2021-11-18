//
//  SecondView.swift
//  testing-uikit-memory-leaks
//
//  Created by Alex Stratu on 18/11/2021.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel: SecondViewModel
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Text("Count down")
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                Text("\(viewModel.seconds)")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 50, height: 50)
                    .background(.yellow)
                    .clipShape(Circle())
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(viewModel: .init())
    }
}
