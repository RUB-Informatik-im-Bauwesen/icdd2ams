# Asset Condition Integration from ICDD to AMS
This repository provides resources and an ontology for integrating BOT located asset conditions inside an Information Container for Linked Document Delivery into SQL-based Asset Management Systems. See the following files for further information:
- src/main/resources/ams/amsData.ttl:  sample dataset for inferring SQL Data
- src/main/resources/ams/amsInferredData.ttl: sample inferred dataset for SQL database import
- src/main/resources/ams/amsRules.ttl: general mapping rules for inferring bot:Element and eurotl:InspectionActivity into SQL schema
- src/main/java/org/iib/bot2ams/ShaclRuleExecution.java.ttl: Java class for inferring the sample dataset with the given rule set (SHACL-SPARQL) to the resulting inferred dataset based on the [Apache Jena Framework 3.4.0 (minimum)](https://mvnrepository.com/artifact/org.apache.jena/jena-arq/3.4.0) dependency

## Contact information
Liu Liu (liu.liu-m6r@rub.de) and Philipp Hagedorn (philipp.hagedorn-n6v@rub.de)
