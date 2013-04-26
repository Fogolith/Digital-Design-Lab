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
                         text = (EditText) findViewById(R.id.tempInput);
    }
    // This method is called at button click because we assigned the name to the
    // "On Click property" of the button
    public void myClickHandler(View view) {
     switch (view.getId()) {
     case R.id.btnCovert:
     RadioButton celsiusButton = (RadioButton) findViewById(R.id.radioCelcius);
     RadioButton fahrenheitButton = (RadioButton) findViewById(R.id.radioFahrenheit);
     if (text.getText().length() == 0) {
	     Toast.makeText(this, "Please enter a valid number",
	                                              Toast.LENGTH_LONG).show();
	     return;
     }
     float inputValue = Float.parseFloat(text.getText().toString());
     if (celsiusButton.isChecked()) {
	     text.setText(String.valueOf(convertFahrenheitToCelsius(inputValue)));
	     celsiusButton.setChecked(false);
	     fahrenheitButton.setChecked(true);
     } else {
         text.setText(String.valueOf(convertCelsiusToFahrenheit(inputValue)));
         fahrenheitButton.setChecked(false);
         celsiusButton.setChecked(true);
     }
     break;
     }
    }
    // Converts to celsius
    private float convertFahrenheitToCelsius(float fahrenheit) {
                         return ((fahrenheit - 32) * 5 / 9);
    }
    // Converts to fahrenheit
    private float convertCelsiusToFahrenheit(float celsius) {
                         return ((celsius * 9) / 5) + 32;
    }
}
     