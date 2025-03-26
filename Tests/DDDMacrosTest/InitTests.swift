//
//  Test.swift
//  Architecture
//
//  Created by Julio Alorro on 16.03.25.
//

import Testing
import DDDMacros
import MacroTesting

@Suite(
  .macros(
    record: .missing,
    macros: ["Init": InitMacro.self]
  )
)
struct InitTests {

  @Test
  func testApiObjects() throws {
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


