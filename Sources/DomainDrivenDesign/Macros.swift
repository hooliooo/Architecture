//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 16.03.25.
//

import Foundation

@attached(member, names: named(init))
public macro Init() = #externalMacro(
    module: "DDDMacros",
    type: "InitMacro"
)

@attached(extension, conformances: Aggregate, Entity, names: arbitrary)
public macro Aggregate(_ idType: Any.Type) = #externalMacro(
  module: "DDDMacros",
  type: "AggregateMacro"
)

@attached(extension, conformances: Entity, names: arbitrary)
public macro Entity(_ idType: Any.Type) = #externalMacro(
  module: "DDDMacros",
  type: "EntityMacro"
)
