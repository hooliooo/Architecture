//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 16.03.25.
//

import Testing
import DDDMacros
import MacroTesting

@Suite(
  "InitMacro tests",
  .macros(
    record: .missing,
    macros: ["Init": InitMacro.self]
  )
)
struct InitTests {

  @Test("The macro should generate the expected output")
  func test() throws {
    assertMacro {
        """
        @Init
        public struct Something: Codable {
          let foo: String
          let bar: Int
          let hello: Bool?
        }
        """
    } expansion: {
      """
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
      """
    }
  }
}


