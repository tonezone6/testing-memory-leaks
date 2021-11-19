
import XCTest
@testable import TestingMemoryLeaks

class SetupTests: XCTestCase {
    let navigation = UINavigationController()
    
    override func setUp() {
        let root = UIViewController()
        navigation.setViewControllers([root], animated: false)
    }
    
    func testFirst() {
        let vc = FirstViewController()
        vc.loadView()
        
        navigation.pushViewController(vc, animated: false)
        navigation.popViewController(animated: false)

        testTeardown(of: vc)
    }

    func testSecond() {
        let vm = SecondViewModel()
        let vc = SecondViewController(viewModel: vm)
        vc.viewDidLoad()
        
        navigation.pushViewController(vc, animated: false)
        navigation.popViewController(animated: false)

        testTeardown(of: vm)
        testTeardown(of: vc)
    }
    
    // MARK: Test view model in isolation.
    
    func testViewModel() {
        let vm = SecondViewModel()
        var wrapper: Wrapper? = .init(viewModel: vm)
        _ = wrapper
        
        wrapper = nil

        testTeardown(of: vm)
    }
}
