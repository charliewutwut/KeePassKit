//
//  KPKFormat.m
//  KeePassKit
//
//  Created by Michael Starke on 12.07.13.
//  Copyright (c) 2013 HicknHack Software GmbH. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "KPKFormat.h"

NSString *const KPKTitleKey     = @"Title";
NSString *const KPKNameKey      = @"Name";
NSString *const KPKUsernameKey  = @"Username";
NSString *const KPKPasswordKey  = @"Password";
NSString *const KPKURLKey       = @"Url";
NSString *const KPKNotesKey     = @"Notes";
NSString *const KPKBinaryKey    = @"Binary";
NSString *const KPKBinaryRefKey = @"BinaryRef";
NSString *const KPKAutotypeKe   = @"Autotype";
NSString *const KPKTagKey       = @"Tags";
NSString *const KPKImageKey     = @"Image";

@interface KPKFormat () {
  NSSet *_defaultKeys;
}

@end

@implementation KPKFormat

+ (id)sharedFormat {
  static id formatInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    formatInstance = [[self _alloc] _init];
  });
  return formatInstance;
}

- (id)_init {
  self = [super init];
  if (self) {
    NSArray *keys = @[ KPKTitleKey,
                       KPKNameKey,
                       KPKUsernameKey,
                       KPKPasswordKey,
                       KPKURLKey,
                       KPKNotesKey,
                       KPKImageKey];
    _defaultKeys = [NSSet setWithArray:keys];
  }
  return self;
}

+ (id)_alloc {
  return [super allocWithZone:nil];
}

+ (id)allocWithZone:(NSZone *)zone {
  return [self sharedFormat];
}

- (NSSet *)defaultKeys {
  return _defaultKeys;
}

- (BOOL)isDefautlKey:(NSString *)key {
  return [_defaultKeys containsObject:key];
}

- (KPKVersion)minimumVersionForKey:(NSString *)key {
  NSAssert(NO, @"Not implemented");
  return KPKVersion1;
}

@end