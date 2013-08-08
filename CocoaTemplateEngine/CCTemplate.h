//
//  CCTemplate.h
//  CocoaTemplateEngine
//
//  Created by xhan on 8/7/13.
//
//

#import <Foundation/Foundation.h>

/*
 *  A lightweight Template Engine
 *  ---------------------------------------
 *  template         ->     'hello {{ name }} !'
 *  with given dict  ->     { name : 'xhan' }
 *  will produce     ->     'hello xhan !'
 * 
 *  That's all, No other features are supported.
 */


@interface CCTemplate : NSObject

@property NSString* head; // {{ by default
@property NSString* tail; // }} by default

- (NSString*)scan:(NSString*)string dict:(NSDictionary*)dict;

@end




@interface NSString (CCTemplate)
- (NSString*)templateFromDict:(NSDictionary*)dict;
@end