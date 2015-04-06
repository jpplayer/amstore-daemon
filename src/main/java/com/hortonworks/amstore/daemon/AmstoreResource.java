package com.hortonworks.amstore.daemon;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Root resource (exposed at "/" path)
 */
//@Path("myresource")
@Path("")
public class AmstoreResource {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String get() throws IOException {
		return "Hello!";
    }
    
    
    @GET 
	@Path("/restart-ambari")
    @Produces(MediaType.TEXT_PLAIN)
    public String restartAmbari() throws IOException {

		ProcessBuilder p = new ProcessBuilder();
		p.command("nohup", "/etc/init.d/ambari-server", "restart");
		p.redirectOutput(Redirect.appendTo(new File(
				"/var/log/amstore-daemon.log")));
		p.redirectErrorStream(true);
		p.start();

		// Runtime.getRuntime().exec("/etc/init.d/ambari-server restart");
		return "Ambari restart initiated. Please wait.";
    }
    
}
