//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 15.03.25.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct DDDMacrosPlugin: CompilerPlugin {

    let providingMacros: [Macro.Type] = [
      AggregateMacro.self,
      EntityMacro.self,
      InitMacro.self,
    ]
}
