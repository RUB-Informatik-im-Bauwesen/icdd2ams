
package org.iib.icdd2ams;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.riot.RDFFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.topbraid.shacl.rules.RuleUtil;
import org.topbraid.spin.util.JenaUtil;

public class ToSQL {
  private static Logger logger = LoggerFactory.getLogger(ToSQL.class);
  private static final Marker Reasoning_MARKER = MarkerFactory.getMarker("icdd2ams");

  public static void main(String[] args) {
    try {
      String date = new SimpleDateFormat("yyyy-MM-dd-hh-mm").format(new Date());
      UUID id = UUID.randomUUID();
      Path path = Paths.get(".").toAbsolutePath().normalize();
      String dataPath = path.toFile().getAbsolutePath() + "/src/main/resources/ams/input/insertData.ttl";      
      String pathMapping = path.toFile().getAbsolutePath() + "/src/main/resources/ams/mappings/amsRules.ttl";

      String data = "file:" + dataPath;
      String shape = "file:" + pathMapping;

      Model dataModel = JenaUtil.createDefaultModel();
      dataModel.read(data);
      Model shapeModel = JenaUtil.createDefaultModel();
      shapeModel.read(shape);
      Model inferenceModel = JenaUtil.createDefaultModel();
      inferenceModel = RuleUtil.executeRules(dataModel, shapeModel, inferenceModel, null);

      String inferences = path.toFile().getAbsolutePath() + "/src/main/resources/ams/output/" + date
          + "_ToSQL_"+id+".ttl";
      File inferencesFile = new File(inferences);
      inferencesFile.createNewFile();
      OutputStream reportOutputStream = new FileOutputStream(inferencesFile);

      RDFDataMgr.write(reportOutputStream, inferenceModel, RDFFormat.TTL);
    } catch (Throwable t) {
      logger.error(Reasoning_MARKER, t.getMessage(), t);
    }
  }
}
