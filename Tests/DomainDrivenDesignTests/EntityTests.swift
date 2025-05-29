//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 26.05.25.
//

import struct Foundation.UUID
@testable import DomainDrivenDesign
import Testing

@Suite("Entity protocol tests")
struct EntityTests {

  @Test("Entity equality should only be based on id")
  func test() {
    let id = UUID()
    let a = TestEntity(id: TestEntity.ID(value: id), anotherProperty: "foo")
    let b = TestEntity(id: TestEntity.ID(value: id), anotherProperty: "bar")

    #expect(a == b)
  }

}

@Entity(UUID.self)
@Init
class TestEntity {
  let id: TestEntity.ID
  let anotherProperty: String
}
