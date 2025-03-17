//
//  Macros.swift
//  Architecture
//
//  Created by Julio Alorro on 16.03.25.
//

import Foundation

@attached(member, names: named(init))
public macro Init() = #externalMacro(
    module: "DDDMacros",
    type: "InitMacro"
)

@attached(extension, conformances: Hashable, names: arbitrary)
public macro Aggregate(_ idType: Any.Type) = #externalMacro(
  module: "DDDMacros",
  type: "AggregateMacro"
)
