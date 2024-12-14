To solve the strong reference cycle problem, use a `weak` property in one of the classes to break the cycle.  Modify either `MyClass` or `OtherClass` (it's usually best to make the property weak that holds the reference to an object that's likely to outlive the parent) like so:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) OtherClass *otherObject;
@end

@implementation MyClass
// ... methods ...
@end

@interface OtherClass : NSObject
@property (weak, nonatomic) MyClass *myObject; // Weak reference!
@end

@implementation OtherClass
// ... methods ...
@end
```

By making the `myObject` property in `OtherClass` `weak`, it will not prevent `MyClass` from being deallocated when it's no longer needed.  This breaks the cycle and solves the memory leak.  Remember to choose which reference to make weak carefully, based on which object's lifetime is expected to be shorter.