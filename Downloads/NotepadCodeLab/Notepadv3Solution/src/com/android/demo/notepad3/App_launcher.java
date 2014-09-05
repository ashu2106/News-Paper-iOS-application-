package com.android.demo.notepad3;

import android.R.string;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;

public class App_launcher extends Activity {

    
	 @Override
	    public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	        
	        SharedPreferences pref = this.getSharedPreferences(
	        	      "notes_mypref", Context.MODE_PRIVATE);
			Editor editor = pref.edit();
	        
			String first_lauch= pref.getString("First_time_launcher1", null);
			
			if(first_lauch == null)
			{
		        setContentView(R.layout.note_create_password);
			}
			else
			{
		        setContentView(R.layout.notes_list);

			}
			
 	       
	    }
}
