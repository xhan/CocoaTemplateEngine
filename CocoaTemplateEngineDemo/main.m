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
        
        CCTemplate* engine = [[CCTemplate alloc] init];

        NSString*template  = @"hello world {{name}} ,  symbol  }} bye bye {{}}";

        NSDictionary* dict = @{@"name":@"xhan", @"symbol":@"!"  };
        NSString*result = [engine scan:template dict:dict];
        
        NSLog(@"> %@",result);
        
    }
    return 0;
}

