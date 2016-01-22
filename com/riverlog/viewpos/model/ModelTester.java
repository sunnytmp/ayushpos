package com.riverlog.viewpos.model;

public class ModelTester {
	public int i = 415878;
   public ModelTester() {
	  
   }
   
   public void runx(){
	  
	   User us = new User();
	   us.setPhone(new Integer(i).toString());
	   i = i+18;
	   try{
	   Thread.sleep(5000);
	   }catch(Exception et){
		   
	   }
	   System.out.println(".. now printed ..i  " + i);
	   }
  
}
