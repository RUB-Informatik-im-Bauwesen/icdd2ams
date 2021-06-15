
package org.iib.icdd2ams;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;

public class ToSQLTemplate {
  private static Logger logger = LoggerFactory.getLogger(ToSQLTemplate.class);
  private static final Marker Reasoning_MARKER = MarkerFactory.getMarker("icdd2ams");
 

  public static void main(String[] args) {
    try {

      Path path = Paths.get(".").toAbsolutePath().normalize();
      String pathJar = path.toFile().getAbsolutePath() + "/src/main/resources/ams/sparql-generate.jar";
      ProcessBuilder pb = new ProcessBuilder("java", "-jar", pathJar,"-dt");
      pb.redirectErrorStream(true);
      Process p = pb.start();
      String line;
      InputStream stdout = p.getInputStream();
      BufferedReader reader = new BufferedReader(new InputStreamReader(stdout));
      while ((line = reader.readLine()) != null) {
        System.out.println("Stdout: " + line);
      }

      
    } catch (Throwable t) {
      logger.error(Reasoning_MARKER, t.getMessage(), t);
    }
  }
}
