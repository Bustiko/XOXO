//
//  XOXOUITests.swift
//  XOXOUITests
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import XCTest
@testable import XOXO


final class XOXOMainPageUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        app = nil
    }

    func testMainPageViewController_WhenViewIsLoaded_RequiredUIElemenetsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        for x in 0..<buttonTotal {
            let button = app.buttons["\(x)"]
            XCTAssertTrue(button.isEnabled, "XO button \(x) is not enabled for user interaction")
        }
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testXOButton_WhenPressed_PresentsResultViewController() {
        
        app.buttons["0"].tap()
        
        XCTAssertTrue(app.otherElements["ResultPageView"].waitForExistence(timeout: 1), "Result page was not presented")
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
