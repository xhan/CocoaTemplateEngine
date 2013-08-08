//
//  main.m
//  CocoaTemplateEngineDemo
//
//  Created by xhan on 8/7/13.
//
//

#import <Foundation/Foundation.h>
#import "CCTemplate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        CCTemplate* engine    = [[CCTemplate alloc] init];
        NSString*   template  = @"hello world {{name}}";
        id    		dict      = @{@"name":@"xhan"};
        NSString*result    = [engine scan:template dict:dict];
        // or just call nsstring category method
        result 			   = [template templateFromDict:dict];
        
        NSLog(@"> %@",result);
        
    }
    return 0;
}

