package com.scottren.slideswitch;

import com.example.hellojni.R;
import com.scottren.slideswitch.SlideSwitch.OnSwitchChangedListener;
import android.app.Activity;
import android.util.Log;
import android.widget.TextView;
import android.os.Bundle;


public class HelloJniActivity extends Activity implements OnSwitchChangedListener
{
    static
    {
        System.loadLibrary("hello-jni");
    }
    
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.main);
        SlideSwitch switch1 = (SlideSwitch)findViewById(R.id.slideSwitch1);
        SlideSwitch switch2 = (SlideSwitch)findViewById(R.id.slideSwitch2);
        SlideSwitch switch3 = (SlideSwitch)findViewById(R.id.slideSwitch3);
        switch3.setText("绑定", "解除");
        switch3.setStatus(true);
        switch1.setOnSwitchChangedListener(this);
        switch2.setOnSwitchChangedListener(this);
        switch3.setOnSwitchChangedListener(this);
    }

    public native int writeToFile(String content, boolean append);
    public native String  stringFromJNI();
    public native String  unimplementedStringFromJNI();

	@Override
	public void onSwitchChanged(SlideSwitch obj, int status)
	{
		TextView tipTextView = (TextView)findViewById(R.id.textViewTip);
		switch (obj.getId()) 
		{
		case R.id.slideSwitch1:
			tipTextView.setText("slideSwitch1 状态：" + status);
			break;
		case R.id.slideSwitch2:
			tipTextView.setText("slideSwitch2 状态：" + status);
			break;
		case R.id.slideSwitch3:
			tipTextView.setText("slideSwitch3 状态：" + status);
			break;
		default:
			break;
		}
		Log.e("onSwitchChanged", obj + " status=" + status);
		
	}
}
