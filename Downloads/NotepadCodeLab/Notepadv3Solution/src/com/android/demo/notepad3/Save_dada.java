package com.android.demo.notepad3;

import android.R.string;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class Save_dada extends Activity{

	 @Override
	    public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	
	     setContentView(R.layout.note_create_password);
	 
	        final EditText intial_password = (EditText) findViewById(R.id.initial_password);
	        final EditText confirm_password = (EditText) findViewById(R.id.confirm_password);

	        Button confirmButton = (Button) findViewById(R.id.confirm);

	        confirmButton.setOnClickListener(new View.OnClickListener() {

	            public void onClick(View view) {
	            String init	=intial_password.getText().toString();
	            String con	= confirm_password.getText().toString();
	            	
	            	if (init.equals(con)){
	            		Toast toast = Toast.makeText(getBaseContext(), "correct", 100);
	
	            	}
	            	
//	                setResult(RESULT_OK);
//	                finish();
	            }

	        });
	        
	 }
}
