//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 18.03.25.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct EntityMacro: ExtensionMacro {

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
    guard
      declaration.memberBlock.members.contains(where: { (member: MemberBlockItemSyntax) -> Bool in
        guard
          let variable = member.decl.as(VariableDeclSyntax.self),
          let binding = variable.bindings.first,
          let identifier = binding.pattern.as(IdentifierPatternSyntax.self)
        else { return false }
        return identifier.identifier.text == "id"
      })
    else { throw MacroExpansionErrorMessage("Entity must have a stored property named `id`.") }

    let accessModifier = declaration.modifiers
      .filter { Constants.accessModifiers.contains($0.trimmedDescription) }

    // Extract the ID type from the macro arguments
    guard
      let argumentList = node.arguments?.as(LabeledExprListSyntax.self),
      let firstArg = argumentList.first,
      let idType = firstArg.expression.as(DeclReferenceExprSyntax.self)?.baseName.text
    else { throw MacroExpansionErrorMessage("Expected a type for the ID struct declaration, e.g., @Entity(Int).") }

    let output: ExtensionDeclSyntax = try ExtensionDeclSyntax(
      """
      extension \(typeName): Entity {
        /**
          The generated type-safe identifier for the Entity/Aggregate with underlying type of \(raw: idType)
          - Conforms to: `EntityID`
        */
        \(accessModifier.trimmed) struct ID: EntityID {
          // The underlying type of the ID struct
          \(accessModifier.trimmed) typealias IDType = \(raw: idType)
          
          // The raw value of the ID
          \(accessModifier.trimmed) let value: \(raw: idType)
          /**
            Creates an instance of \(typeName).ID
            - Parameter value: The Hashable type used as the unique identifier for the ID of \(typeName)
          */
          \(accessModifier.trimmed) init(value: \(raw: idType)) {
            self.value = value
          }
        }
      }
      """
    )

    return [output]
  }


}
