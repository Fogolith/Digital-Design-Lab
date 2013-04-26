package com.example.IMG;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.picviewer.R;



public class IMG
{
    // Private member of this class. Class is like a more powerful struct in C, you can have member variables
    // and member methods
    private Bitmap mBitMap;
    private TextView mTextView;
    private ImageView mImage;
    private int mImgWidth, mImgHeight;
    private float mAngle = 90.0f;
    private int mIndex = 0;
    private int[] mImgs = new int[6]; // We have three images for you to play with
    private android.content.res.Resources resource; 
    
    public static final int cwImg = 0; 
    public static final int ccwImg = 1; 
    public static final int leftImg = 2;
    public static final int rightImg = 3;
    public static final int punchImg = 4;
    public static final int zergImg = 5;
    
    public IMG(android.content.res.Resources resource, TextView mTextViewIn, ImageView mImageIn)
    {
    	this.resource = resource;
        mImgs[cwImg] = R.drawable.clockwiseimage;
        mImgs[ccwImg] = R.drawable.counterclockwiseimage;
        mImgs[leftImg] = R.drawable.leftarrow;
        mImgs[rightImg] = R.drawable.rightarrow;
        mImgs[punchImg] = R.drawable.punch; 
        mImgs[zergImg] = R.drawable.zerg; 
       mTextView = mTextViewIn;
       mImage = mImageIn;
        
        
        mBitMap = BitmapFactory.decodeResource(resource, mImgs[mIndex]);
       mImage.setImageResource(mImgs[mIndex]);  // Easiest way to show a image
       updateSize();
    }
    
    public void ZoomIn(View view) {
        mImgHeight += 50;
        mImgWidth += 50;
         mBitMap = Bitmap.createScaledBitmap(mBitMap, mImgWidth, mImgHeight, true);
         mImage.setImageBitmap(mBitMap);
         updateSize();
     }
    
	public void ZoomOut(View view) {
	       mImgHeight -= 50;
	       mImgWidth -= 50;
	       // If overflow, we keep the size unchanged
	       if (mImgHeight < 0 || mImgWidth < 0) {
	              mImgHeight += 50;
	              mImgWidth += 50;
	       }     
	        mBitMap = Bitmap.createScaledBitmap(mBitMap, mImgWidth, mImgHeight, true);
	        mImage.setImageBitmap(mBitMap);
	        updateSize();
	    }
	   
	    public void Change(View view, int num) {
	    	mBitMap = BitmapFactory.decodeResource(resource, mImgs[num]);
	        mImage.setImageBitmap(mBitMap);
	        updateSize();
	    }
	   
	    public void Rotate(View view) {
	       Matrix matrix = new Matrix();
	       Log.d("test", "" + mAngle);
	        matrix.postRotate(mAngle); // Each time we rotate for 90 degree
	        mBitMap = Bitmap.createBitmap(mBitMap, 0, 0, mImgWidth, mImgHeight, matrix, true);
	       mImage.setImageBitmap(mBitMap);
	        updateSize();
	    }
	   
	    public void updateSize() {
	        // Grab information about size of image
	       mImgHeight = mBitMap.getHeight();
	       mImgWidth = mBitMap.getWidth();
	       mTextView.setText("The width is " + mImgWidth + ", the height is " + mImgHeight + ".");
	    }
}

