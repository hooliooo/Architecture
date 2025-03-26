//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 15.03.25.
//

import SwiftSyntax
import SwiftSyntaxMacros

public struct InitMacro: MemberMacro {

  public static func expansion(
    of node: AttributeSyntax,
    providingMembersOf declaration: some DeclGroupSyntax,
    conformingTo protocols: [TypeSyntax],
    in context: some MacroExpansionContext
  ) throws -> [DeclSyntax] {
    let accessModifier = declaration.modifiers
      .filter { Constants.accessModifiers.contains($0.trimmedDescription) }
    let members: MemberBlockItemListSyntax = declaration.memberBlock.members
    let props = members.reduce(into: [(name: String, type: String)].init()) {
      (current: inout [(name: String, type: String)], element: MemberBlockItemSyntax) -> Void in
      guard
        let variable = element.decl.as(VariableDeclSyntax.self),
        let binding = variable.bindings.first,
        let identifier = binding.pattern.as(IdentifierPatternSyntax.self),
        let type = binding.typeAnnotation?.type
      else { return }
      let name = identifier.identifier.text
      current.append((name: name, type: type.description))
    }

    let parameters = props
        .map { "\($0.name): \($0.type)"}
        .joined(separator: ",\n")

    let assignments = props
        .map { "self.\($0.name) = \($0.name)"}
        .joined(separator: "\n")

    return [
        """
        \(accessModifier.trimmed) required init(
          \(raw: parameters)
        ) {
          \(raw: assignments)
        }
        """
    ]
  }


}
