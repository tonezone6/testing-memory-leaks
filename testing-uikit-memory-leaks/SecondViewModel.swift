//
//  ViewModel.swift
//  testing-uikit-memory-leaks
//
//

import Combine
import Foundation

class SecondViewModel: ObservableObject {
    let timer = Timer.publish(every: 1, on: .main, in: .default)
    let count = 4

    @Published var seconds: Int
    @Published var finished: Void?
    
    init() {
        seconds = count
        
        timer.autoconnect()
            .scan(count) { acc, _ in acc - 1 }
            .prefix(count)
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.finished = ()
            })
            .assign(to: &$seconds)
    }
}
