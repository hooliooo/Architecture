//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 An Entity is a reference type that is defined primarily by its identity. Two Entities are the same, if they have the same identity/identifier,
 even if their attributes are different
 */
open class Entity<ID: Hashable> {

  /**
   Creates an Entity instance
   - Parameter id: The identitier of the Entity
   */
  public init(id: EntityID<ID>) {
    self.id = id
  }

  /**
   The identity of the Entity
   */
  public let  id: EntityID<ID>

}

extension Entity: Hashable {

  public static func == (lhs: Entity, rhs: Entity) -> Bool {
    return lhs.id == rhs.id
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
}
