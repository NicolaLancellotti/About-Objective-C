#import "NLClass.h"

@implementation NLClass {
  
#pragma mark - Instance Variables without Properties
  /*
   You can add them inside braces at the top of the class interface,
   implementation or class extension
   */
  NSString * _instanceVariable;
}

#pragma mark - Custom Synthesized Instance Variable Names
/*
 @synthesize propertyName = instanceVariableName;
 
 If you use @synthesize without specifying an instance variable name
 the instance variable will bear the same name as the property.
 */
@synthesize readwriteProperty1 = ivar_readwriteProperty1;

#pragma mark - Init
/*
 You should always access the instance variables directly from within an
 initialization method because at the time a property is set, the rest of the
 object may not yet be completely initialized. Even if you don’t provide custom
 accessor methods or know of any side effects from within your own class,
 a future subclass may very well override the behavior.
 */

/*
 If you need to write an initialization method when subclassing a class that
 uses multiple init methods, you should either override
 * the superclass’s designated initializer to perform your own initialization, or
 * add your own additional initializer.
 Either way, you should call the superclass’s designated initializer
 (in place of [super init];) before doing any of your own initialization.
 */

#pragma mark - Unavailable Initializer

- (instancetype)init
{
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

#pragma mark - Designated Initializer

- (instancetype)initWithString:(NSString*)aString
{
  self = [super init];
  if (self) {
    // initialize instance variables here
  }
  return self;
}

#pragma mark - Convenience Initializer

- (instancetype)initWithInt:(int)anInt
{
  return [self initWithString:[NSString stringWithFormat:@"%d",anInt]];
}

#pragma mark - Custom Accessor Methods
/*
 If you implement
 * both a getter and a setter for a readwrite property, or
 * a getter for a readonly property,
 the compiler will assume that you are taking control over the property
 implementation and won’t synthesize an instance variable automatically.
 
 If you still need an instance variable, you’ll need to request that one be
 synthesized: @synthesize property = _property;
 
 Because the internal implementation and synchronization of atomic accessor
 methods is private, it’s not possible to combine a synthesized accessor with
 an accessor method that you implement yourself.
 */
- (NSString*)readonlyProperty
{
  return @"Hello, World!";
}

+ (NSInteger)classProperty
{
  return 10;
}

#pragma mark - Instance Methods

- (void)doSomething
{
  NSLog(@"Hello, World!");
}

-(nullable NSString*)someMethodWithFirstValue:(NSString*)value1
                                  secondValue:(NSString*)value2
{
  return nil;
}

#pragma mark - Class Methods

+ (void)doSomething
{
  NSLog(@"Hello, World! (Class method)");
}

#pragma mark - Method with Variable Arguments

+ (NSInteger)sum:(NSInteger)num_args, ...
{
  va_list ap;
  va_start(ap, num_args);
  
  int sum = 0;
  for(int i = 0; i < num_args; ++i) {
    sum += va_arg(ap, NSInteger);
  }
  
  va_end(ap);
  return sum;
}

@end

#pragma mark - Final Classes

@implementation NLFinalClass

@end
