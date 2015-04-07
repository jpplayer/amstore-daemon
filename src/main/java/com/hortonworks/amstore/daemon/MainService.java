package com.hortonworks.amstore.daemon;

public class MainService {
    public final String defaultHost = "0.0.0.0";
    public final String defaultPort = "5026";

    protected String host = defaultHost;
    protected String port = defaultPort;

    public MainService(  ) {}

    public MainService( String host, String port ) {
    	this.host = host;
    	this.port = port;
    }
    
    public String getBaseUri(){
    	return "http://" + host + ":" + port + "/amstore/";
    }
}
