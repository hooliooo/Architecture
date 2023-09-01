//
//  Architecture
//  MIT license, see LICENSE file for details
//  Created by Julio Alorro on 01.09.23.
//

import struct Foundation.Date

/**
 A Request is a message that is consumed by the system to either to modify the state of a system or retrieve data from the system but never both
 at the same time
 */
public protocol Request {

  /**
   The primitive type used as the identifier of the Request
   */
  associatedtype RequestIDType: Hashable
  /**
   The primitive type used as the identifier of the actor that issued the Request
   */
  associatedtype IssuerIDType: Hashable

  /**
   The unique identifier of the Request. Used in observability or traceability systems for bookkeeping, telemetry or monitoring purposes
   */
  var id: RequestID<RequestIDType> { get }

  /**
   The unique identifier of the actor who issued the Request. Used in observability or traceability systems for bookkeeping,
   telemetry or monitoring purposes
   */
  var issuerID: IssuerID<IssuerIDType> { get }

  /**
   The date and time of when the Request was issued. Used in observability or traceability systems for bookkeeping,
   telemetry or monitoring purposes
   */
  var issuedAt: Date { get }

}
