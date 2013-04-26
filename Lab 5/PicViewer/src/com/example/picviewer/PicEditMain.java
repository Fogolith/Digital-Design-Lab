package com.example.picviewer;

import android.app.Activity;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.example.IMG.*;
 
public class PicEditMain extends Activity implements SensorEventListener {
       // Private member of this class. Class is like a more powerful struct in C, you can have member variables
       // and member methods

       private IMG img; 
       private  SensorManager sensorManager;
       OnHeadlineSelectedListener mCallback;
       
       // The container Activity must implement this interface so the frag can deliver messages
       public interface OnHeadlineSelectedListener {
           /** Called by HeadlinesFragment when a list item is selected */
           public void onArticleSelected(int position);
       }
      
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pic_edit_main);
        ImageView mImage = (ImageView) findViewById(R.id.imageView1);
        TextView mTextView = (TextView) findViewById(R.id.dasTextBox);
       img = new IMG(getResources(), mTextView, mImage); 
       
       sensorManager = (SensorManager)this.getSystemService(Context.SENSOR_SERVICE);
       sensorManager.registerListener(this, sensorManager.getDefaultSensor(Sensor.TYPE_LINEAR_ACCELERATION),
              SensorManager.SENSOR_DELAY_NORMAL);
       
       // This makes sure that the container activity has implemented
       // the callback interface. If not, it throws an exception.
       try {
           mCallback = (OnHeadlineSelectedListener) this.mCallback;
       } catch (ClassCastException e) {
           throw new ClassCastException(this.toString()
                   + " must implement OnHeadlineSelectedListener");
       }
       img.Change(mImage, IMG.zergImg);
       
    } 

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    // TODO Auto-generated method stub
 
    }
    
    private enum Direction {
    	LEFT, 
    	RIGHT, 
    	UP, 
    	DOWN, 
    	FORWARD, 
    	BACK, 
    	NONE
    }
    
    private int state; 
    
    int CWcount = 0;
    int CCWcount = 0; 
    int LRcount = 0; 
    int FBCount = 0; 
    
    Direction oldDir; 
    
    private void changeState(Direction dir)
    {
    	switch (state)
    	{
      	case 1: // Initial
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		break;
    	case 2: // Left
    		if(dir == Direction.LEFT){ 
    			state = 2;
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			CWcount++; 
    			CCWcount = 0; 
    			LRcount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = +1; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			CWcount = 0; 
    			CCWcount++; 
    			LRcount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    		}
    		break;
    	case 3: // Up
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			CWcount = 0; 
    			CCWcount++; 
    			LRcount = 0;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			CWcount++; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		break;
    	case 4: // Right
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = -1;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			CWcount = 0; 
    			CCWcount++; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			//LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			CWcount++; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		break;
    	case 5: // Down 
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			CWcount++; 
    			CCWcount = 0; 
    			LRcount = 0;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			CWcount = 0; 
    			CCWcount++; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		break;
    	case 6: // Forward
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			//FBCount = 0; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = -1; 
    		}
    		break;
    	case 7: // Backward
    		if(dir == Direction.LEFT){ 
    			state = 2;
    			CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0;
    			FBCount = 0; 
    		}
    		if(dir == Direction.UP){
    			state = 3;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0;  
    		}
    		if(dir == Direction.RIGHT) {
    			state = 4;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.DOWN) {
    			state = 5; 
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 0; 
    		}
    		if(dir == Direction.FORWARD) {
    			state = 6;
    			CWcount = 0; 
    			CCWcount = 0; 
    			LRcount = 0; 
    			FBCount = 1; 
    		}	
    		if(dir == Direction.BACK) {
    			state = 7;
    			//CWcount = 0; 
    			//CCWcount = 0; 
    			LRcount = 0; 
    			//FBCount = 0; 
    		}
    		break;
    	default:
    		state = 1; 
			break; 
    	}
    }
    
    public class Rolling {

        private int size;
        private double total = 0d;
        private int index = 0;
        private double samples[];

        public Rolling(int size) {
            this.size = size;
            samples = new double[size];
            for (int i = 0; i < size; i++) samples[i] = 0d;
        }

        public void add(double x) {
            total -= samples[index];
            samples[index] = x;
            total += x;
            if (++index == size) index = 0; // cheaper than modulus
        }

        public double getAverage() {
            return total / size;
        }   
    }
    
    private final int RollingAmmount = 3; 
    Rolling xIntegral = new Rolling(RollingAmmount); 
    Rolling yIntegral = new Rolling(RollingAmmount); 
    Rolling zIntegral = new Rolling(RollingAmmount); 
    
    
    Rolling xDoubleIntegral = new Rolling(RollingAmmount); 
    Rolling yDoubleIntegral = new Rolling(RollingAmmount); 
    Rolling zDoubleIntegral = new Rolling(RollingAmmount); 
    
    @Override
    public void onSensorChanged(SensorEvent event) {
    // TODO Auto-generated method stub
        // check sensor type
        final double aThreshold = 2.6;
        if(event.sensor.getType()==Sensor.TYPE_LINEAR_ACCELERATION){
 
             // assign directions
        	 xIntegral.add(event.values[0]); 
        	 yIntegral.add(event.values[1]); 
        	 zIntegral.add(event.values[2]); 
        	 
        	 //xDoubleIntegral.add(xIntegral.getAverage()); 
        	 //yDoubleIntegral.add(yIntegral.getAverage()); 
        	 //zDoubleIntegral.add(zIntegral.getAverage()); 
        	 
        	 double x =  Math.round(xIntegral.getAverage()*1000.0)/1000.0; 
        	 double y =  Math.round(yIntegral.getAverage()*1000.0)/1000.0; 
        	 double z =  Math.round(zIntegral.getAverage()*1000.0)/1200.0;
        	  
        	 
             ((TextView) findViewById(R.id.txtX)).setText("X: "+ x);
             ((TextView) findViewById(R.id.txtY)).setText("Y: "+ y);
             ((TextView) findViewById(R.id.txtZ)).setText("Z: "+ z);
             
             if (Math.abs(x) < aThreshold && Math.abs(y) < aThreshold && Math.abs(z) < aThreshold) {
                    //noneCount++; 
                    //if(noneCount > 10)
                    //{
                    	//state = 1; 
                    	//((TextView) findViewById(R.id.dasTextBox)).setText("Direction: none" + " State: " + state);
                    	//ResetState(null);
                    //}
                    
            	 	return;
             }
             //noneCount = 0; 
    
         	xIntegral = new Rolling(RollingAmmount); 
            yIntegral = new Rolling(RollingAmmount); 
            zIntegral = new Rolling(RollingAmmount);
             
             Direction currentDir = Direction.NONE;
             
             double coneSize = 1.3; 
             
             if(Math.abs(x)/Math.abs(y) > coneSize && Math.abs(x)/Math.abs(z) > coneSize )
             {
            	if(x < 0)
            	{
            		currentDir = Direction.RIGHT; 
            	}
            	else
            	{
            		currentDir = Direction.LEFT; 
            	}
             }
             
             if(Math.abs(y)/Math.abs(x) > coneSize && Math.abs(y)/Math.abs(z) > coneSize )
             {
            	 if(x > 0)
             	{
             		currentDir = Direction.UP; 
             	}
             	else
             	{
             		currentDir = Direction.DOWN; 
             	}
             }
             
             if(Math.abs(z)/Math.abs(x) > coneSize && Math.abs(z)/Math.abs(y) > coneSize )
             {
            	 if(x > 0)
             	{
             		currentDir = Direction.FORWARD; 
             	}
             	else
             	{
             		currentDir = Direction.BACK; 
             	}
             }
             changeState(currentDir); 
             
             ImageView mImage = (ImageView) findViewById(R.id.imageView1);
             
             String message = ""; 
             if(CWcount > 2)
             {
            	 img.Change(mImage, IMG.cwImg);
            	 message = " CW";
             }
             else if(CCWcount > 2)
             {
            	 img.Change(mImage, IMG.ccwImg);
            	 message = " CCW";
             }
             else if(LRcount == -1)
             {
            	 img.Change(mImage, IMG.rightImg);
            	 message = " Right";
             }
             else if(LRcount == 1)
             {
            	 img.Change(mImage, IMG.leftImg);
            	 message = " Left";
             }
             else if(FBCount != 0 )
             {
            	 img.Change(mImage, IMG.punchImg);
            	 message = " Punch";
             }
             
             ((TextView) findViewById(R.id.dasTextBox)).setText("Direction: "+ currentDir + message + " CW: " + CWcount + " CCW: " + CCWcount);
             
             /*switch (state)
             {
             case 4: 
            	 img.Change(mImage, 2); 
            	 break; 
             case 5: 
            	 img.Change(mImage, 3); 
            	 break; 
             case 8: 
            	 img.Change(mImage, 0); 
            	 break; 
             case 11: 
            	 img.Change(mImage, 1); 
            	 break; 
             case 13: 
            	 img.Change(mImage, 4); 
            	 break; 
             }*/
             
             
             
             
        }
 
    }
    
    public void ResetState(View view)
    {
    	state = 0; 
    	ImageView mImage = (ImageView) findViewById(R.id.imageView1);
    	img.Change(mImage, 5);
    	xIntegral = new Rolling(RollingAmmount); 
        yIntegral = new Rolling(RollingAmmount); 
        zIntegral = new Rolling(RollingAmmount); 
        
        
        xDoubleIntegral = new Rolling(RollingAmmount); 
        yDoubleIntegral = new Rolling(RollingAmmount); 
        zDoubleIntegral = new Rolling(RollingAmmount); 
    }
}
