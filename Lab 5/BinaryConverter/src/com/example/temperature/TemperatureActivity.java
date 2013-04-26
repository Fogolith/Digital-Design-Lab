package com.example.temperature;
 
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;
public class TemperatureActivity extends Activity {
    private EditText text;
    @Override
    public void onCreate(Bundle savedInstanceState) {
                         super.onCreate(savedInstanceState);
                         setContentView(R.layout.activity_temperature);
                         text = (EditText) findViewById(R.id.numInput);
    }
    // This method is called at button click because we assigned the name to the
    // "On Click property" of the button
    public void convertButtonHandler(View view) {
     switch (view.getId()) {
     case R.id.btnCovert:
     RadioButton binBtn = (RadioButton) findViewById(R.id.radBin);
     RadioButton octBtn = (RadioButton) findViewById(R.id.radOctal);
     RadioButton hexBtn = (RadioButton) findViewById(R.id.radHex);
     if (text.getText().length() == 0) {
	     Toast.makeText(this, "Please enter a valid number",
	                                              Toast.LENGTH_LONG).show();
	     return;
     }
     int inputValue; 
     try
     {
    	 inputValue = Integer.parseInt(text.getText().toString());
     }
     catch (Exception e)
     {
    	 Toast.makeText(this, "Please enter a valid number",
                 Toast.LENGTH_LONG).show();
    	 return;
     }
    		 
     if (hexBtn.isChecked()) {
	     text.setText("0x" + Integer.toHexString(inputValue));
	     
     } else if (octBtn.isChecked()) {
         text.setText("0o" + Integer.toOctalString(inputValue));
     }
     else 
     {
    	 text.setText("0b" + Integer.toBinaryString(inputValue));
     }
     break;
     }
    }
}
     