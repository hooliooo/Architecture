//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//

/**
 A ValueObject is an object that defines its identity by its attributes. Two ValueObjects of the same type are identical if their
 attributes are identical
 - Conforms to: `Hashable`
 */
public protocol ValueObject: Hashable {}
