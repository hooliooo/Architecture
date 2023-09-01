//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 An Aggregate Root is an Entity that is the core or main Entity within a cluster of objects or Aggregate (cluster of Value Objects and/or other Entities
 that must stay consistent (be modified together) within a single transaction
 */
open class AggregateRoot<ID: Hashable, T: DomainEvent>: Entity<ID> {

  /**
   A list of Domain Events that describe the changes that occurred within the Aggregate
   */
  public private(set) var domainEvents: Array<T> = []

  /**
   Adds a new DomainEvent to the Aggregate
   */
  func add(domainEvent: T) {
    self.domainEvents.append(domainEvent)
  }

  /**
   Removes and returns all the DomainEvents that have been added to the Aggregate
   */
  func clearDomainEvents() -> Array<T> {
    let elements = self.domainEvents
    self.domainEvents.removeAll(keepingCapacity: true)
    return elements
  }

}
