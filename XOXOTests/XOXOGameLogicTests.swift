//
//  XOXOTests.swift
//  XOXOTests
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import XCTest
@testable import XOXO

final class XOXOGameLogicTests: XCTestCase {
    
    private var sut: GameLogicModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         sut = GameLogicModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testGameLogicModel_WhenUnoccupiedButtonPressed_ButtonTextGetsChangedToCharacter() {
        
        // Arrange
        let button = buttons[0]
        let character: AttributedString = "X"
        
        // Act
        sut.processPressLogic(forButton: button, currentPlayer: character)
        
        // Assert
        XCTAssertEqual(button.configuration?.attributedTitle, character, "Text of the unoccupied button was not changed when pressed")
    }
    
    func testGameLogicModel_WhenOccupiedButtonPressed_ButtonTextStaysUnchanged() {
        
        // Arrange
        let button = buttons[0]
        let character: AttributedString = "X"
        
        button.configuration?.attributedTitle = "X"
        
        // Act
        sut.processPressLogic(forButton: button, currentPlayer: character)
        
        // Assert
        XCTAssertEqual(button.configuration?.attributedTitle, "X", "Text of the already occupied button was changed when pressed" )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
