//
//  CHKGiftCard.h
//  CheckoutAnywhere
//
//  Created by IBK Ajila on 2015-03-17.
//  Copyright (c) 2015 Shopify Inc. All rights reserved.
//

#import "CHKObject.h"
#import "CHKSerializable.h"

@class CHKCheckout;

@interface CHKGiftCard : CHKObject <CHKSerializable>

@property (nonatomic, readonly, copy) NSString *code;
@property (nonatomic, readonly, copy) NSString *lastCharacters;
@property (nonatomic, readonly, strong) NSNumber *balance;
@property (nonatomic, readonly, strong) NSNumber *amountUsed;
@property (nonatomic, readonly, strong) CHKCheckout *checkout;

@end
