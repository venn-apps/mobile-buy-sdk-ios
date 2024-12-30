//
//  PayCheckoutUserErrors.swift
//  Pay
//
//  Created by Joshua Gare on 08/04/2020.
//  Copyright © 2020 Shopify Inc. All rights reserved.
//

import Foundation
import PassKit

public enum PayCheckoutUserErrors: String {

    /// Input email contains an invalid domain name.
    case badDomain = "BAD_DOMAIN"
    
    /// Input Zip is invalid for country provided.
    case invalidForCountry = "INVALID_FOR_COUNTRY"

    /// Input Zip is invalid for country and province provided.
    case invalidForCountryAndProvince = "INVALID_FOR_COUNTRY_AND_PROVINCE"

    /// Invalid province in country.
    case invalidProvinceInCountry = "INVALID_PROVINCE_IN_COUNTRY"

    /// Invalid region in country.
    case invalidRegionInCountry = "INVALID_REGION_IN_COUNTRY"

    /// Invalid state in country.
    case invalidStateInCountry = "INVALID_STATE_IN_COUNTRY"
    
    /// Unknown error but still a failure.
    case unknown
}

extension PayCheckoutUserErrors {
    
    // MARK: - Computed Variables
    
    var paymentAuthoirzationStatus: PKPaymentAuthorizationStatus {
        switch self {
        case .badDomain:
            return .invalidShippingContact
        case .invalidForCountry:
            return .invalidShippingPostalAddress
        case .invalidForCountryAndProvince:
            return .invalidShippingPostalAddress
        case .invalidProvinceInCountry:
            return .invalidShippingPostalAddress
        case .invalidRegionInCountry:
            return .invalidShippingPostalAddress
        case .invalidStateInCountry:
            return .invalidShippingPostalAddress
        case .unknown:
            return .failure
        }
    }
    
}
