//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 A strongly typed struct that encapsulates the value an Entity's identifier
 - Conforms to: `Hashable`

 An EntityID's `IDType` must be `Hashable`
 */
public protocol EntityID: Hashable {

  /// The raw type of the EntityID
  associatedtype IDType: Hashable

  /// The raw value of the EntityID
  var value: IDType { get }
}
