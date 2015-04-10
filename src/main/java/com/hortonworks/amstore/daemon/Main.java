package com.hortonworks.amstore.daemon;

import org.glassfish.grizzly.http.server.HttpServer;
import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

import java.io.IOException;
import java.net.URI;

/**
 * Main class.
 *
 */
public class Main {
    // Base URI the Grizzly HTTP server will listen on
//    public static final String BASE_URI = "http://0.0.0.0:5026/amstore/";


    /**
     * Starts Grizzly HTTP server exposing JAX-RS resources defined in this application.
     * @return Grizzly HTTP server.
     */
    public static HttpServer startServer( String baseUri ) {
        // create a resource config that scans for JAX-RS resources and providers
        // in com.hortonworks.amstore.daemon package
        final ResourceConfig rc = new ResourceConfig().packages("com.hortonworks.amstore.daemon");

        // create and start a new instance of grizzly http server
        // exposing the Jersey application at BASE_URI
        return GrizzlyHttpServerFactory.createHttpServer(URI.create( baseUri ), rc);
    }

    /**
     * Main method.
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException, InterruptedException {

    	
    	MainService mainService;
    	if( args.length == 3) {
    		mainService = new MainService(args[1], args[2] );
    	} else
    	{
    		mainService = new MainService( );    		
    	}
    	
        final HttpServer server = startServer( mainService.getBindUri() );
        System.out.println(String.format("Jersey app started with WADL available at "
                + "%sapplication.wadl\n", mainService.getBindUri()));
//        System.in.read();
//        server.stop();
    }
    

}

