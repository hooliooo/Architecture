//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 26.03.25.
//

import Testing
import DDDMacros
import MacroTesting

@Suite(
  "EntityMacro tests",
  .macros(
    record: .missing,
    macros: ["Entity": EntityMacro.self]
  )
)
struct EntityTests {

  @Test("The macro should generate the expected output")
  func test() throws {
    assertMacro {
        """
        @Entity(UUID.self)
        public class User {
          public let id: User.ID
          public var firstName: String
          public var lastName: String
          public var username: String
          public var email: String?
        }
        """
    } expansion: {
      """
      public class User {
        public let id: User.ID
        public var firstName: String
        public var lastName: String
        public var username: String
        public var email: String?
      }

      extension User: Entity {
        /**
          The generated type-safe identifier for the Entity/Aggregate with underlying type of UUID
          - Conforms to: `EntityID`
        */
        public struct ID: EntityID {
          // The underlying type of the ID struct
          public typealias IDType = UUID

          // The raw value of the ID
          public let value: UUID
          /**
            Creates an instance of User.ID
            - Parameter value: The Hashable type used as the unique identifier for the ID of User
          */
          public init(value: UUID) {
            self.value = value
          }
        }
      }
      """
    }
  }
}
