//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 01.09.23.
//

/**
 A strongly typed struct that encapsulates the value a Request's identifier
 */
public struct RequestID<T: Hashable>: Hashable {

  /**
   Creates an instance of RequestID
   - Parameter value: The Hashable type used as the unique identifier for the RequestID
   */
  public init(value: T) {
    self.value = value
  }

  /**
   The underlying value of the RequestID
   */
  public var value: T

}
