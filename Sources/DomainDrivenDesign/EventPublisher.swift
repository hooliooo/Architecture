//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 01.09.23.
//

/**
 An EventPublisher is a domain service that is responsible for broadcasting DomainEvents of Aggregates
 so interested parties can listen and respond accordingly
 */
public protocol EventPublisher {

  /**
   Publishes a DomainEvent
   - Parameter event: The DomainEvent to be published
   - Parameter id: The identifier of the published message containing the DomainEvent that interested subscribers can use to listen in
                   on specfic DomainEvents
   */
  func publish(event: any DomainEvent, id: String)

}
