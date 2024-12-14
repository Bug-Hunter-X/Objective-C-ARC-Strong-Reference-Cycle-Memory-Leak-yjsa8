In Objective-C, a common yet subtle issue arises when dealing with memory management using ARC (Automatic Reference Counting).  Consider the scenario where a class retains an instance of another class. If not handled correctly, strong reference cycles can occur, leading to memory leaks.  For example:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) OtherClass *otherObject;
@end

@implementation MyClass
// ... methods ...
@end

@interface OtherClass : NSObject
@property (strong, nonatomic) MyClass *myObject;
@end

@implementation OtherClass
// ... methods ...
@end
```

If an instance of `MyClass` retains an instance of `OtherClass`, and vice-versa, neither object will ever be deallocated, resulting in a memory leak.  This is because both hold strong references to each other. 