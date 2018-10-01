/**
 * @class      PlayerSelectionOption PlayerSelectionOption.m "PlayerSelectionOption.m"
 * @brief      An object that contains the information needed to represent an example.
 * @details    An object that contains the information needed to represent an example.
 *             This object is passed between the List and the Player to transfer the information
 * @date       12/12/14
 * @copyright  Copyright (c) 2014 Ooyala, Inc. All rights reserved.
 */

#import "PlayerSelectionOption.h"

@implementation PlayerSelectionOption

- (instancetype)initWithTitle:(NSString *)title
                    embedCode:(NSString *)embedCode
                        pcode:(NSString *)pcode
                       domain:(NSString *)domain {
  if (self = [super init]) {
    self.title = title;
    self.embedCode = embedCode;
    self.pcode = pcode;
    self.domain = domain;
  }
  return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    embedCode:(NSString *)embedCode
                        pcode:(NSString *)pcode
                       domain:(NSString *)domain
          embedTokenGenerator:(id<OOEmbedTokenGenerator>)embedTokenGenerator {
  if (self = [self initWithTitle:title embedCode:embedCode pcode:pcode domain:domain]) {
    _embedTokenGenerator = embedTokenGenerator;
  }
  return self;
}
@end
