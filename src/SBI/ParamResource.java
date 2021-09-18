package SBI;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path(value = "/parameter")
public class ParamResource {
    @GET
    @Path("/query")
    @Produces(MediaType.TEXT_PLAIN)
    public String getQuery(@QueryParam("param") String s) {
    	return s;
    }
}
