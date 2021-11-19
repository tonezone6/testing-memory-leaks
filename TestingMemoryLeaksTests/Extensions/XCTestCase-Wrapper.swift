
import Foundation
import XCTest

extension XCTestCase {
    // Generic helper class to hold and test view model deallocation
    class Wrapper<T: ObservableObject> {
        let viewModel: T
        
        init(viewModel: T) {
            self.viewModel = viewModel
        }
    }
}
