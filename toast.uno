using Uno;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;
using Uno.UX;

using Uno.Compiler.ExportTargetInterop;

[extern(Android) ForeignInclude(Language.Java, "android.app.Activity","android.widget.Toast")]

[UXGlobalModule]
public class myToast : NativeModule
{
    public myToast(){
        AddMember(new NativeFunction("toastIt", (NativeCallback)ToastIt));
    }

    static object ToastIt(Fuse.Scripting.Context c, object[] args)
    {
        var arg = args[0] as string;
        ToastIt(arg);

        return null;
    }

    [Foreign(Language.Java)]
    static extern(Android) void ToastIt(string message)
    @{
        final android.app.Activity context = com.fuse.Activity.getRootActivity();
        context.runOnUiThread(new Runnable(){
            public void run(){
                Toast.makeText(com.fuse.Activity.getRootActivity(),message,Toast.LENGTH_LONG).show();
            }

        });
    @}

    static extern(!Android) void ToastIt(string message)
    {
        debug_log("Toast not supported on this platform.");
    }
}