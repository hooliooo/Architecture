//
//  AggregateTests.swift
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
    macros: ["Aggregate": AggregateMacro.self]
  )
)
struct AggregateTests {

  @Test
  func test() throws {
    assertMacro {
        """
        @Aggregate(UUID)
        public class Something: Codable {
          let id: String
          let bar: Int
          let hello: Bool?
        }
        """
    } expansion: {
      """
      public class Something: Codable {
        let id: String
        let bar: Int
        let hello: Bool?
      }

      extension Something: Hashable {

        public static func == (lhs: Something, rhs: Something) -> Bool {
          return lhs.id == rhs.id
        }

        public func hash(into hasher: inout Hasher) {
          hasher.combine(self.id)
        }

      }

      extension Something {
        public struct ID: Hashable {

          public let value: UUID

          public init(value: UUID) {
            self.value = value
          }

        }
      }
      """
    }
  }
}
