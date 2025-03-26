//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 16.03.25.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct AggregateMacro: ExtensionMacro {

  public static func expansion(
    of node: SwiftSyntax.AttributeSyntax,
    attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
    providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
    conformingTo protocols: [SwiftSyntax.TypeSyntax],
    in context: some SwiftSyntaxMacros.MacroExpansionContext
  ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {

    guard let typeName = type.as(IdentifierTypeSyntax.self)?.name else {
      throw MacroExpansionErrorMessage("Cannot extract type name")
    }

    let entitySyntax: [ExtensionDeclSyntax] = try EntityMacro.expansion(
      of: node,
      attachedTo: declaration,
      providingExtensionsOf: type,
      conformingTo: protocols,
      in: context
    )

    let decl2: ExtensionDeclSyntax = try ExtensionDeclSyntax(
      """
      extension \(typeName): Aggregate {
        public static let typeName: String = "\(typeName)"
      }
      """
    )
    return entitySyntax + [decl2]
  }

}
