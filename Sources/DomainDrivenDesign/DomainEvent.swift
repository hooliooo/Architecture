//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 A DomainEvent is a notable event that has happened to an Aggregate that may interest other Aggregates or services. DomainEvents are essentially messages
 to other objects that don't need to be transactionally up to date with the Aggregate in question but may need to update something in response to the
 DomainEvents transmitted and be updated after some time has elapsed (eventual consistency).
 */
public protocol DomainEvent: Hashable {}
