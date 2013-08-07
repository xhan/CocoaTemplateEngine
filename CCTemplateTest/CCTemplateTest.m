//
//  CCTemplateTest.m
//  CCTemplateTest
//
//  Created by xhan on 8/7/13.
//
//

#import <XCTest/XCTest.h>
#import "CCTemplate.h"

@interface CCTemplateTest : XCTestCase
@property NSString* template;
@property NSDictionary* dict;
@property NSString* expects;
@end

@implementation CCTemplateTest
{
    CCTemplate* engine;
}


- (void)setUp
{
    [super setUp];
    engine = [[CCTemplate alloc] init];

}

- (void)tearDown
{
    engine = nil;
    _template = nil;
    _dict = nil;
    _expects = nil;
    [super tearDown];
}

- (void)doBaseTest
{
    NSString* result = [engine scan:_template
                               dict:_dict];
    XCTAssertEqualObjects(result, self.expects, @"expect: %@\n"
                   "result: %@",_expects,result);
}


- (void)testSimple
{
    self.template =  @"hello world {{name}} {{symbol  }}";
    self.dict = @{@"name":@"xhan", @"symbol":@"!"  };
    self.expects = @"hello world xhan !";
    
    [self doBaseTest];
}


- (void)testEmpty
{
    self.template = @"}} {{name}} bye {{empty}} bye {{";
    self.dict = @{@"name":@"xhan"};
    self.expects = @"}} xhan bye  bye {{";
    [self doBaseTest];
}


@end
