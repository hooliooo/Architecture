//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 An EntityRepresentable is an object that has Entity semantics, which means it is an object that is defined primarily by its identity.
 Two Entities are the same, if they have the same identity/identifier, even if their attributes are different
 - Conforms to: `Hashable`
 */
public protocol EntityRepresentable: Hashable {
  /**
   The type of the id
   */
  associatedtype IdentifierType: Hashable

  /**
   The id of the Entity
   */
  var id: IdentifierType { get }

}

extension EntityRepresentable {

  public static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
}
