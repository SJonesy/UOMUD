package com.planet_ink.coffee_mud.core.collections;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Vector;
/*
Copyright 2000-2011 Bo Zimmerman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
public class MultiListEnumeration<K> implements Enumeration<K>
{
	private final LinkedList<List<K>> lists=new LinkedList<List<K>>();
	private volatile Iterator<List<K>> listIter = null; 
	private volatile Iterator<K> iter = null; 
    
	public MultiListEnumeration(List<K>... esets) 
    {
        if((esets!=null)&&(esets.length>0))
        	lists.addAll(Arrays.asList(esets));
		setup();
    }
    
	public MultiListEnumeration(List<K> eset) 
    {
		lists.add(eset);
		setup();
    }
    
	private void setup()
	{
		listIter=lists.iterator();
    	if(iter == null)
    	{
    		if(listIter.hasNext())
	    		iter=listIter.next().iterator();
    	}
	}
	
	public void addEnumeration(List<K> set)
	{
		if(set != null)
			lists.add(set);
		setup();
	}
	
    public boolean hasMoreElements() 
    { 
    	if(iter==null) return false;
    	if(iter.hasNext()) return true;
    	while((!iter.hasNext())&&(listIter.hasNext()))
    		iter = listIter.next().iterator();
    	return iter.hasNext();
    }
    
    public K nextElement() 
    {
    	if(!hasMoreElements())
    		throw new NoSuchElementException();
    	return iter.next();
    }
}
