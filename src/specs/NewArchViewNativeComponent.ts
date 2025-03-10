import { ViewProps } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { DirectEventHandler } from 'react-native/Libraries/Types/CodegenTypes';

type Prop1 = Readonly<{
    propContent: string;
}>;

type Prop2 = Readonly<{
    propContent: string;
}>;

export type NativeEvent1 = Readonly<{
    nativeEventContent: string;
}>;

export type NativeEvent2 = Readonly<{
    nativeEventContent: string;
}>;

export interface NewArchViewProps extends ViewProps {
    prop1: Prop1;
    prop2: Prop2;
    onNativeEvent1: DirectEventHandler<NativeEvent1>;
    onNativeEvent2: DirectEventHandler<NativeEvent2>;
}

export default codegenNativeComponent<NewArchViewProps>('NewArchView');
