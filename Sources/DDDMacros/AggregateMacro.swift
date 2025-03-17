//
//  IDMacro.swift
//  Architecture
//
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
    guard let classDecl = declaration.as(ClassDeclSyntax.self) else {
      throw MacroExpansionErrorMessage("Not a class. Aggregates must be a reference type.")
    }
    guard classDecl.memberBlock.members.contains(where: { (member: MemberBlockItemSyntax) -> Bool in
      guard
        let variable = member.decl.as(VariableDeclSyntax.self),
        let binding = variable.bindings.first,
        let identifier = binding.pattern.as(IdentifierPatternSyntax.self)
      else { return false }
      return identifier.identifier.text == "id"
    }) else {
      throw MacroExpansionErrorMessage("Aggregate must have a stored property named `id`.")
    }
    let accessModifier = declaration.modifiers
      .filter { Constants.accessModifiers.contains($0.trimmedDescription) }
    let writtenExtension: DeclSyntax =
    """
    extension \(classDecl.name): Hashable {

      \(accessModifier.trimmed) static func == (lhs: \(raw: classDecl.name.text), rhs: \(raw: classDecl.name.text)) -> Bool {
        return lhs.id == rhs.id
      }

      \(accessModifier.trimmed) func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
      }

    }
    """

    guard let decl = writtenExtension.as(ExtensionDeclSyntax.self) else {
      return []
    }

    // Extract the ID type from the macro arguments
    guard let argumentList = node.arguments?.as(LabeledExprListSyntax.self),
          let firstArg = argumentList.first,
          let idType = firstArg.expression.as(DeclReferenceExprSyntax.self)?.baseName.text else {
      throw MacroExpansionErrorMessage("Expected a type for the ID struct declaration, e.g., @Aggregate(Int).")
    }

    let idExtension: DeclSyntax =
    """
    extension \(classDecl.name) {
      public struct ID: Hashable {
        
        public let value: \(raw: idType)
    
        public init(value: \(raw: idType)) {
          self.value = value
        }
        
      }
    }
    """

    guard let decl2 = idExtension.as(ExtensionDeclSyntax.self) else {
      return [decl]
    }

    return [decl, decl2]
  }

}
