//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 31.08.23.
//


/**
 A UseCase encapsulates a list of actions or event steps that are executed between an actor and a system to achieve some goal. In other words,
 it encapsulates business logic within a system
 */
public protocol UseCase {

  /**
   The input of the UseCase required to execute business logic
   */
  associatedtype Request

  /**
   The result from executing the business logic
   */
  associatedtype Response

  /**
   Executes the business logic
   - Parameter request: The Request containing the information necessary to carry out the steps defined within this function
   - Returns: The output of resulting from executing the business logic successfully
   */
  func handle(request: Request) async throws -> Response

}
