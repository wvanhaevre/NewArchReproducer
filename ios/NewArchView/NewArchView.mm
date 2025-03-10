#import "NewArchView.h"

#import <react/renderer/components/NewArchSpec/ComponentDescriptors.h>
#import <react/renderer/components/NewArchSpec/EventEmitters.h>
#import <react/renderer/components/NewArchSpec/Props.h>
#import <react/renderer/components/NewArchSpec/RCTComponentViewHelpers.h>

using namespace facebook::react;

@interface NewArchView () <RCTNewArchViewViewProtocol>
@end

@implementation NewArchView {
  UIView  *_view;
  UILabel *_label1;
  UILabel *_label2;
  NSTimer *_timer;
}

-(instancetype)init {
  if(self = [super init]) {
    _view = [UIView new];
    [self addSubview:_view];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    [_label1 setTextColor:[UIColor whiteColor]];
    [_label1 setBackgroundColor:[UIColor clearColor]];
    [_label1 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [_view addSubview:_label1];
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 300, 20)];
    [_label2 setTextColor:[UIColor whiteColor]];
    [_label2 setBackgroundColor:[UIColor clearColor]];
    [_label2 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [_view addSubview:_label2];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:true block:^(NSTimer * _Nonnull timer) {
      // EMIT NATIVEEVENT1 WITH OPTIONAL DATA
      NewArchViewEventEmitter::OnNativeEvent1 event1;
      event1.nativeEventContent = [self randomString];
      event1.nativeEventOptionalContent1 = [self randomString];
      event1.nativeEventOptionalContent2 = [self randomString];
      self.eventEmitter.onNativeEvent1(event1);
      
      // EMIT NATIVEEVENT2 WITHOUT OPTIONAL DATA
      NewArchViewEventEmitter::OnNativeEvent2 event2;
      event2.nativeEventContent = [self randomString];
      self.eventEmitter.onNativeEvent2(event2);
    }];
  }
  return self;
}

- (std::string) randomString {
  return [[[NSUUID UUID] UUIDString] UTF8String];
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps {
  const auto &oldViewProps = *std::static_pointer_cast<NewArchViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<NewArchViewProps const>(props);
  
  // RECEIVING DATA
  if (newViewProps.prop1.propContent != oldViewProps.prop1.propContent) {
    _label1.text = @(newViewProps.prop1.propContent.c_str());
  }
  if (newViewProps.prop2.propContent != oldViewProps.prop2.propContent) {
    _label2.text = @(newViewProps.prop2.propContent.c_str());
  }
  
  [super updateProps:props oldProps:oldProps];
}

-(void)layoutSubviews {
  [super layoutSubviews];
  _view.frame = self.bounds;
}

Class<RCTComponentViewProtocol> NewArchViewCls (void) {
    return NewArchView.class;
}

// Event emitter convenience method
- (const NewArchViewEventEmitter &)eventEmitter {
  return static_cast<const NewArchViewEventEmitter &>(*_eventEmitter);
}

+ (ComponentDescriptorProvider)componentDescriptorProvider {
  return concreteComponentDescriptorProvider<NewArchViewComponentDescriptor>();
}

@end
