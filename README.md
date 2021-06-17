# Asset Condition Integration from information containers into relational Asset Management databases (icdd2ams)

This repository contains ontologies, data, queries, and source code presented in "BIM-based organization of inspection data using Semantic Web technology for infrastructure asset management" published at EUROSTRUCT 2021 conference. It includes a minimal ABox ontology for integrating  asset conditions located using [Building Topology Ontology (BOT)](https://github.com/w3c-lbd-cg/bot) within an [Information Container for linked document delivery (ICDD)](https://www.iso.org/standard/74389.html) into SQL-based asset management systems. See the following files:

### Code
- [`src/main/java/org/iib/icdd2ams/ToSQL.java`](src/main/java/org/iib/icdd2ams/ToSQL.java): inferring the sample data set with the given rule set to the resulting inferred data set 
- [`src/main/java/org/iib/icdd2ams/ToSQLTemplate.java`](src/main/java/org/iib/icdd2ams/ToSQLTemplate.java): generating an SQL insert query form a SPARQL Template (STTL) 
 
### Resources [input]
- [`src/main/resources/ams/input/amsData.ttl`](src/main/resources/ams/input/amsData.ttl): sample data set for inferring SQL Data 
- [`src/main/resources/ams/input/insertData.ttl`](src/main/resources/ams/input/insertData.ttl): sample data set for the generation of SQL INSERT query using STTL 
- [`src/main/resources/ams/input/amsSqlData.ttl`](src/main/resources/ams/input/amsSqlData.ttl): sample data set extracted from SQL database 
- [`src/main/resources/ams/input/sql/20210610_AMS_database_draft.sql`](src/main/resources/ams/input/sql/20210610_AMS_database_draft.sql): SQL dump of the database used for the extraction of structural information 

### Resources [mappings]
- [`src/main/resources/ams/mappings/query.rqg`](src/main/resources/ams/mappings/query.rqg): sample SPARQL template for generating SQL INSERT query using STTL
- [`src/main/resources/ams/mappings/amsRules.ttl`](src/main/resources/ams/mappings/amsRules.ttl): general mapping rules for inferring `bot:Element` and `eurotl:InspectionActivity` into SQL Schema 
- [`src/main/resources/ams/mappings/icdd2ams.ttl`](src/main/resources/ams/mappings/icdd2ams.ttl) : Ontology for adding relations between `bot`, `eurotl` and `asbing`, see [Documentation](https://icdd.vm.rub.de/ontology/icdd2ams/)

## Third party licenses and dependencies
- this approach makes use of SPARQL-Generate (sparql-generate.jar) extension of Apache Jena for STTL generation provided on https://github.com/sparql-generate/sparql-generate under Apache License, Version 2.0. 
- this approach makes use of the R2RML Implementation (r2rml.jar) provided on https://github.com/chrdebru/r2rml-distributions under MIT license. 
- implementation is based on the [Apache Jena Framework 3.4.0 (minimum)](https://mvnrepository.com/artifact/org.apache.jena/jena-arq/3.4.0) dependency

## Acknowledgments
The authors gratefully acknowledge CEDR (Conference of European Directors of Roads) and FFG (Austrian Research Promotion Agency) for funding this research; We would like to thank the consortium of research projects [AMSFree](https://www.inf.bi.ruhr-uni-bochum.de/iib/forschung/amsfree.html.en) and [BIM4AMS](https://www.inf.bi.ruhr-uni-bochum.de/iib/forschung/bim4ams.html.en) for their collaboration in the research of asset management for bridges.

## Contact information
Liu Liu (liu.liu-m6r@rub.de / [ResearchGate profile](https://www.researchgate.net/profile/Liu-Liu-84)) and Philipp Hagedorn (philipp.hagedorn-n6v@rub.de / [GitHub profile](https://github.com/philhag) / [ResearchGate profile](https://www.researchgate.net/profile/Philipp-Hagedorn))  
Further information on https://www.inf.bi.ruhr-uni-bochum.de/iib/index.html.en
