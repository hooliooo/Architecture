//
//  EntityID.swift
//  
//
//  Created by Julio Alorro on 31.08.23.
//

/**
 A strongly typed struct that encapsulates the value an Entity's identifier
 */
public struct EntityID<T: Hashable>: Hashable {

  /**
   Creates an instance of EntityID
   - Parameter value: The Hashable type used as the unique identifier for the EntityID
   */
  public init(value: T) {
    self.value = value
  }

  /**
   The underlying value of the EntityID
   */
  public var value: T

}
