package com.planet_ink.coffee_mud.web.macros;
import java.util.*;
import com.planet_ink.coffee_mud.interfaces.*;

public class WebServerPort extends StdWebMacro
{
	public String name()	{return "WebServerPort";}

	public String runMacro(ExternalHTTPRequests httpReq)
	{
		return httpReq.getWebServerPortStr();
	}

}