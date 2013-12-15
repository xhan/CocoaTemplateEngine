//
//  CCTemplate.m
//  CocoaTemplateEngine
//
//  Created by xhan on 8/7/13.
//
//

#import "CCTemplate.h"

#if !__has_feature(objc_arc)
#error "enable ARC by add -fobjc-arc"
#endif

@implementation CCTemplate

- (id)init
{
    self = [super init];
    self.head = @"{{";
    self.tail = @"}}";
    return self;
}

- (NSString*)scan:(NSString*)string dict:(NSDictionary*)dict
{
    NSMutableString* buffer = [[NSMutableString alloc] initWithCapacity:string.length*2];
    NSString* scanedStr  = nil;
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:string];
    [scanner setCaseSensitive:YES]; // case sensitive
    [scanner setCharactersToBeSkipped:nil]; //not to ignore any chars
    
    // found head
    while ([scanner scanUpToString:self.head intoString:&scanedStr] || (scanedStr.length == 0)) {
        if (scanedStr != nil)
            [buffer appendString:scanedStr];
        if( scanner.isAtEnd ) break;
        
        //step over head-flag
        [scanner scanString:self.head intoString:nil];
        
        //scan the key-iVar
        scanedStr = nil;
        [scanner scanUpToString:self.tail intoString:&scanedStr];
        
        //step over tail-flag , and check if key-iVar exists
        BOOL tailExist = [scanner scanString:self.tail intoString:nil];
        
        
        if (tailExist ) {
            // trim writespace and newline(if possible)
            NSString* key = [scanedStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // TODO: should warning key value not exists
            id value = dict[key] ?: @"";
            [buffer appendString:value];
        }else{
            // add head and scanned body back to buffer
            [buffer appendString:self.head];
            if (scanedStr) {
                [buffer appendString:scanedStr];
            }
            
        }
        
        // [scanner scanUpToString:intoString:] will not clear intoString itself
        scanedStr = @"";
        
    }
    return [NSString stringWithString:buffer];
}

@end


@implementation NSString (CCTemplate)

- (NSString*)templateFromDict:(NSDictionary*)dict
{
    return [[[CCTemplate alloc] init] scan:self dict:dict];
}

@end