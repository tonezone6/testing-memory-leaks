//
//  testing_uikit_memory_leaksTests.swift
//  testing-uikit-memory-leaksTests
//
//  Created by Alex Stratu on 18/11/2021.
//

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
        vc.loadView() // setup done in `loadView`
        
        navigation.pushViewController(vc, animated: false)
        navigation.popViewController(animated: false)

        testTeardown(of: vc)
    }

    func testSecond() {
        let vm = SecondViewModel()
        let vc = SecondViewController(viewModel: vm)
        vc.viewDidLoad() // setup done in `viewDidLoad`
        
        navigation.pushViewController(vc, animated: false)
        navigation.popViewController(animated: false)

        testTeardown(of: vm)
        testTeardown(of: vc)
    }
}

extension XCTestCase {
    func testTeardown<T>(of instance: T, file: StaticString = #filePath, line: UInt = #line)
    where T: AnyObject {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "was not deallocated", file: file, line: line)
        }
    }
}

