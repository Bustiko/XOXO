//
//  ResultPageUITests.swift
//  XOXOUITests
//
//  Created by Buse Karabıyık on 22.01.2024.
//

import XCTest
@testable import XOXO

final class ResultPageUITests: XCTestCase {
    
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
    }

    func testResultPageViewController_WhenViewLoaded_ButtonIsenabled() throws {
        // UI tests must launch the application that they test.
       
        for x in 0...Variables.buttonTotal-Variables.buttonTotalSquared {
            app.buttons["\(x)"].tap()
        }
        
        let button = app.buttons["Play Again"]
        
        //*** screenshots
        let buttonScreenshot = button.screenshot()
        let buttonAttachment = XCTAttachment(screenshot: buttonScreenshot)
        buttonAttachment.name = "Screenshot of Play Again button"
        buttonAttachment.lifetime = .keepAlways
        add(buttonAttachment)
        
        //let currentAppWindowScreenshot = app.screenshot()
        let currentAppWindowScreenshot = XCUIScreen.main.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindowScreenshot)
        currentAppWindowAttachment.name = "Screenshot of the Result Page"
        currentAppWindowAttachment.lifetime = .keepAlways
        add(currentAppWindowAttachment)
        
        //***
        
        XCTAssertTrue(button.isEnabled, "Play Again button is not enabled for user interaction")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPlayAgainButton_WhenPressed_ResultViewControllerGetsDismissed() {
        
        for x in 0...Variables.buttonTotal-Variables.buttonTotalSquared {
            app.buttons["\(x)"].tap()
        }
        
        app.buttons["Play Again"].tap()
        
        XCTAssertTrue(app.otherElements["MainPageView"].waitForExistence(timeout: 1), "Result page was not dismissed when play again button was pressed")
        
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
