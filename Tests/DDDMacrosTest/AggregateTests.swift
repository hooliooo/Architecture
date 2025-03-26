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

      extension Something: Entity {
        /**
          The generated type-safe identifier for the Entity/Aggregate with un underlying type of UUID
        */
        public struct ID: EntityID {
          // The underlying type of the ID struct
          public typealias IDType = UUID

          // The raw value of the ID
          public let value: UUID
          /**
            Creates an instance of Something.ID
            - Parameter value: The Hashable type used as the unique identifier for the ID of Something
          */
          public init(value: UUID) {
            self.value = value
          }
        }
      }

      extension Something: Aggregate {
        public static let typeName: String = "Something"
      }
      """
    }
  }
}
