//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 16.03.25.
//

import Testing
import DDDMacros
import SwiftSyntaxMacroExpansion
import SwiftSyntaxMacrosGenericTestSupport

@Suite(
  "InitMacro tests",
)
struct InitTests {

  @Test("The init macro should correctly generate the expected code")
  func test() throws {
    assertMacroExpansion(
        """
        @Init
        public struct Something: Codable {
          let foo: String
          let bar: Int
          let hello: Bool?
        }
        """,
        expandedSource: """
        public struct Something: Codable {
          let foo: String
          let bar: Int
          let hello: Bool?
        
            public required init(
              foo: String,
              bar: Int,
              hello: Bool?
            ) {
              self.foo = foo
              self.bar = bar
              self.hello = hello
            }
        }
        """,
        macroSpecs: ["Init": MacroSpec(type: InitMacro.self)],
        failureHandler: { failure in
          Issue.record(Comment(stringLiteral: failure.message))
        }
    )
  }
}


