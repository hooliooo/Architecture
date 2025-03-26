//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 A strongly typed struct that encapsulates the value an Event's identifier
 */
public struct EventID<T: Hashable>: Hashable {

  /**
   Creates an instance of EventID
   - Parameter value: The Hashable type used as the unique identifier for the EventID
   */
  public init(value: T) {
    self.value = value
  }

  /**
   The underlying value of the EventID
   */
  public var value: T

}
