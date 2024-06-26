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
         sut.createAttributedString()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testGameLogicModel_WhenUnoccupiedButtonPressed_ButtonTextGetsChangedToCharacter() {
        
        // Arrange
        let button = Variables.buttons[0]
        let character: AttributedString = AttributedString("X", attributes: Variables.container)
        
        // Act
        sut.createAttributedString()
        sut.processPressLogic(forButton: button, currentPlayer: character)
        
        // Assert
        XCTAssertEqual(button.configuration?.attributedTitle, character, "Text of the unoccupied button was not changed when pressed. Actual: \(button.attributedTitle(for: .normal)?.string ?? "nil"), Expected: \(character)")
    }
    
    func testGameLogicModel_WhenOccupiedButtonPressed_ButtonTextStaysUnchanged() {
        
        // Arrange
        let button = Variables.buttons[0]
        let character: AttributedString = AttributedString("O", attributes: Variables.container)
        
        button.configuration?.attributedTitle = AttributedString("X", attributes: Variables.container)
        
        // Act
        sut.processPressLogic(forButton: button, currentPlayer: character)
        
        // Assert
        XCTAssertEqual(button.configuration?.attributedTitle, AttributedString("X", attributes: Variables.container), "Text of the already occupied button was changed when pressed" )
    }
    
    func testGameLogicModel_WhenSpecificCharacterProvided_ChangesCharacterForNextRound() {
        
        // Arrange
        let character: AttributedString = AttributedString("X", attributes: Variables.container)
        
        // Act
        let nextCharacter = sut.getNextPlayer(currentCharacter: character)
        
        // Assert
        XCTAssertNotEqual(nextCharacter, character, "Character was not changed for the next round")
        
    }
    
    func testGameLogicModel_WhenHorizantalWinOccurs_DecideWinner() {
        
        // Arrange
        for x in 0..<Variables.buttonTotalSquared {
            Variables.buttons[x].configuration?.attributedTitle = AttributedString("O", attributes: Variables.container)
        }
        
        // Act
        let horizantalWinner = sut.decideChampion()
        
        // Assert
        XCTAssertEqual(horizantalWinner, AttributedString("O", attributes: Variables.container))
    }
    
    func testGameLogicModel_WhenVerticalWinOccurs_DecideWinner() {
        
        // Arrange
        for x in 0..<Variables.buttonTotalSquared {
            Variables.buttons[Variables.buttonTotalSquared*x].configuration?.attributedTitle = AttributedString("O", attributes: Variables.container)
        }
        
        // Act
        let verticalWinner = sut.decideChampion()
        
        // Assert
        XCTAssertEqual(verticalWinner, AttributedString("O", attributes: Variables.container))
    }
    
    func testGameLogicModel_WhenDiagonalWinOccurs_DecideWinner() {
        
        // Arrange
        for x in 0..<Variables.buttonTotalSquared {
            Variables.buttons[Variables.buttonTotalSquared*x+x].configuration?.attributedTitle = AttributedString("O", attributes: Variables.container)
        }
        
        // Act
        let diagonalWinner = sut.decideChampion()
        
        // Assert
        XCTAssertEqual(diagonalWinner, AttributedString("O", attributes: Variables.container))
    }
    
    
    func testGameLogicModel_WhenDrawOccurs_ReturnTrue() {
        
        for x in 0..<Variables.buttonTotal {
            Variables.buttons[x].configuration?.attributedTitle = AttributedString("O", attributes: Variables.container)
        }
        
        let isDraw = sut.decideIfDraw()
        
        XCTAssertTrue(isDraw)
        
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
