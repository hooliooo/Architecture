//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 An Aggregate is a cluster of objects (Value Objects, other Entities, primitives, etc) that must stay consistent (be modified together) within a single transactional boundary.
 - Conforms to: `Entity`
 */
public protocol Aggregate: Entity {

  /**
   The string name of the Aggregate
   */
  static var typeName: String { get }

}
