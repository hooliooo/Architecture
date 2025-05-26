//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 26.05.25.
//

import DomainDrivenDesign
import Testing

@Suite("ValueObject protocol tests")
class ValueObjectTests {

  @Test("ValueObject equality should be based on all properties")
  func test() {
    let a = Foo(foo: "Foo", bar: 0)
    let b = Foo(foo: "Foo", bar: 0)
    let c = Foo(foo: "Bar", bar: 0)

    #expect(a == b)
    #expect(a != c)
    #expect(b != c)

  }
}

struct Foo: ValueObject {
  let foo: String
  let bar: Int
}

