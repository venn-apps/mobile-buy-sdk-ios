//
//  CustomerAccessTokenCreatePayload.swift
//  Buy
//
//  Created by Shopify.
//  Copyright (c) 2024 Shopify Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension Storefront {
	/// Return type for `customerAccessTokenCreate` mutation. 
	open class CustomerAccessTokenCreatePayloadQuery: GraphQL.AbstractQuery, GraphQLQuery {
		public typealias Response = CustomerAccessTokenCreatePayload

		/// The newly created customer access token object. 
		@discardableResult
		open func customerAccessToken(alias: String? = nil, _ subfields: (CustomerAccessTokenQuery) -> Void) -> CustomerAccessTokenCreatePayloadQuery {
			let subquery = CustomerAccessTokenQuery()
			subfields(subquery)

			addField(field: "customerAccessToken", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// The list of errors that occurred from executing the mutation. 
		@discardableResult
		open func customerUserErrors(alias: String? = nil, _ subfields: (CustomerUserErrorQuery) -> Void) -> CustomerAccessTokenCreatePayloadQuery {
			let subquery = CustomerUserErrorQuery()
			subfields(subquery)

			addField(field: "customerUserErrors", aliasSuffix: alias, subfields: subquery)
			return self
		}

		/// The list of errors that occurred from executing the mutation. 
		@available(*, deprecated, message: "Use `customerUserErrors` instead.")
		@discardableResult
		open func userErrors(alias: String? = nil, _ subfields: (UserErrorQuery) -> Void) -> CustomerAccessTokenCreatePayloadQuery {
			let subquery = UserErrorQuery()
			subfields(subquery)

			addField(field: "userErrors", aliasSuffix: alias, subfields: subquery)
			return self
		}
	}

	/// Return type for `customerAccessTokenCreate` mutation. 
	open class CustomerAccessTokenCreatePayload: GraphQL.AbstractResponse, GraphQLObject {
		public typealias Query = CustomerAccessTokenCreatePayloadQuery

		internal override func deserializeValue(fieldName: String, value: Any) throws -> Any? {
			let fieldValue = value
			switch fieldName {
				case "customerAccessToken":
				if value is NSNull { return nil }
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: CustomerAccessTokenCreatePayload.self, field: fieldName, value: fieldValue)
				}
				return try CustomerAccessToken(fields: value)

				case "customerUserErrors":
				guard let value = value as? [[String: Any]] else {
					throw SchemaViolationError(type: CustomerAccessTokenCreatePayload.self, field: fieldName, value: fieldValue)
				}
				return try value.map { return try CustomerUserError(fields: $0) }

				case "userErrors":
				guard let value = value as? [[String: Any]] else {
					throw SchemaViolationError(type: CustomerAccessTokenCreatePayload.self, field: fieldName, value: fieldValue)
				}
				return try value.map { return try UserError(fields: $0) }

				default:
				throw SchemaViolationError(type: CustomerAccessTokenCreatePayload.self, field: fieldName, value: fieldValue)
			}
		}

		/// The newly created customer access token object. 
		open var customerAccessToken: Storefront.CustomerAccessToken? {
			return internalGetCustomerAccessToken()
		}

		func internalGetCustomerAccessToken(alias: String? = nil) -> Storefront.CustomerAccessToken? {
			return field(field: "customerAccessToken", aliasSuffix: alias) as! Storefront.CustomerAccessToken?
		}

		/// The list of errors that occurred from executing the mutation. 
		open var customerUserErrors: [Storefront.CustomerUserError] {
			return internalGetCustomerUserErrors()
		}

		func internalGetCustomerUserErrors(alias: String? = nil) -> [Storefront.CustomerUserError] {
			return field(field: "customerUserErrors", aliasSuffix: alias) as! [Storefront.CustomerUserError]
		}

		/// The list of errors that occurred from executing the mutation. 
		@available(*, deprecated, message: "Use `customerUserErrors` instead.")
		open var userErrors: [Storefront.UserError] {
			return internalGetUserErrors()
		}

		func internalGetUserErrors(alias: String? = nil) -> [Storefront.UserError] {
			return field(field: "userErrors", aliasSuffix: alias) as! [Storefront.UserError]
		}

		internal override func childResponseObjectMap() -> [GraphQL.AbstractResponse] {
			var response: [GraphQL.AbstractResponse] = []
			objectMap.keys.forEach {
				switch $0 {
					case "customerAccessToken":
					if let value = internalGetCustomerAccessToken() {
						response.append(value)
						response.append(contentsOf: value.childResponseObjectMap())
					}

					case "customerUserErrors":
					internalGetCustomerUserErrors().forEach {
						response.append($0)
						response.append(contentsOf: $0.childResponseObjectMap())
					}

					case "userErrors":
					internalGetUserErrors().forEach {
						response.append($0)
						response.append(contentsOf: $0.childResponseObjectMap())
					}

					default:
					break
				}
			}
			return response
		}
	}
}
