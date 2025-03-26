//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 01.09.23.
//

/**
 A strongly typed struct that encapsulates the value an Issuer's identifier
 */
public struct IssuerID<T: Hashable>: Hashable {

  /**
   Creates an instance of IssuerID
   - Parameter value: The Hashable type used as the unique identifier for the IssuerID
   */
  public init(value: T) {
    self.value = value
  }

  /**
   The underlying value of the IssuerID
   */
  public var value: T

}
