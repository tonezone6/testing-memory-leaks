
import XCTest

extension XCTestCase {
    func testTeardown<T>(of instance: T, file: StaticString = #filePath, line: UInt = #line)
    where T: AnyObject {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "was not deallocated", file: file, line: line)
        }
    }
}
