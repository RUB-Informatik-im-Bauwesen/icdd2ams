# Asset Condition Integration from information containers into relational Asset Management databases (icdd2ams)

This repository contains ontologies, data, queries, and source code presented in "BIM-based organization of inspection data using Semantic Web technology for infrastructure asset management" published at Eurostruct 2021 conference. It contains a small ABox ontology for integrating  asset conditions located using [Building Topology Ontology (BOT)](https://github.com/w3c-lbd-cg/bot) and the [Information Container for linked document delivery (ICDD)](https://www.iso.org/standard/74389.html) into SQL-based asset management systems. See the following files:

### code
- `src/main/java/org/iib/icdd2ams/ToSQL.java`: inferring the sample data set with the given rule set to the resulting inferred data set  
- `src/main/java/org/iib/icdd2ams/ToSQLTemplate.java`: generating an SQL insert query form a SPARQL Template 
 
### resources [input]
- `src/main/resources/ams/input/amsData.ttl`: sample data set for inferring SQL Data
- `src/main/resources/ams/input/insertData.ttl`: sample data set for the generation of SQL INSERT query using STTL
- `src/main/resources/ams/input/amsSqlData.ttl`: sample data set extracted from SQL database
- `src/main/resources/ams/input/sql/20210610_AMS_database_draft.sql`: SQL dump of the database used for the extraction of structural information

### resources [mappings]
- `src/main/resources/ams/query.rqg`: sample SPARQL template for generating SQL INSERT query using STTL
- `src/main/resources/ams/amsRules.ttl`: general mapping rules for inferring `bot:Element` and `eurotl:InspectionActivity` into SQL Schema
- `src/main/resources/ams/amsicdd.ttl`: Ontology for adding relations between `bot`, `eurotl` and `asbing` 

## Third party licenses and dependencies
- this approach makes use of SPARQL-Generate (sparql-generate.jar) extension of Apache Jena for STTL generation provided on https://github.com/sparql-generate/sparql-generate under Apache License, Version 2.0. 
- this approach makes use of the R2RML Implementation (r2rml.jar) provided on https://github.com/chrdebru/r2rml-distributions under MIT license. 
- implementation is based on the [Apache Jena Framework 3.4.0 (minimum)](https://mvnrepository.com/artifact/org.apache.jena/jena-arq/3.4.0) dependency

## Acknowledgments
The authors gratefully acknowledge CEDR (Conference of European Directors of Roads) and FFG (Austrian Research Promotion Agency) for funding this research; We would like to thank the consortium of research projects [AMSFree](https://www.inf.bi.ruhr-uni-bochum.de/iib/forschung/amsfree.html.en) and [BIM4AMS](https://www.inf.bi.ruhr-uni-bochum.de/iib/forschung/bim4ams.html.en) for their collaboration in the research of asset management for bridges.

## Contact information
Liu Liu (liu.liu-m6r@rub.de / [ResearchGate profile](https://www.researchgate.net/profile/Liu-Liu-84)) and Philipp Hagedorn (philipp.hagedorn-n6v@rub.de / [GitHub profile](https://github.com/philhag) / [ResearchGate profile](https://www.researchgate.net/profile/Philipp-Hagedorn))  
Further information on https://www.inf.bi.ruhr-uni-bochum.de/iib/index.html.en


# Ontology documentation: Asset Condition Integration of BOT Elements amsicdd

## Metadata
* **IRI**
  * `http://icdd.vm.rub.de/ontology/amsicdd#`
* **Creators(s)**
  * Liu Liu
  * Philipp Hagedorn
* **Created**
  * 2021-03-24
* **Imports**
  * [asbing:](http://asbing.de/condition/def/)
  * [bot:](https://w3id.org/bot#)
  * [eurotl:](http://www.roadotl.eu/def/)
* **License**
  * [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)
* **Ontology RDF**
  * RDF ([amsicdd.ttl](turtle))
### Description
<p>Ontology for integrating BOT located asset conditions into sql based asset management systems</p>

## Table of Contents
1. [Object Properties](#objectproperties)
1. [Namespaces](#namespaces)
1. [Legend](#legend)

## Object Properties
[The Activity relation representing the inspection of a building](#TheActivityrelationrepresentingtheinspectionofabuilding),
[The condition of an element regarding an inspection activity](#Theconditionofanelementregardinganinspectionactivity),
[](TheActivityrelationrepresentingtheinspectionofabuilding)
### The Activity relation representing the inspection of a building
Property | Value
--- | ---
IRI | `http://icdd.vm.rub.de/ontology/amsicdd#hadActivity`
Description | The Activity relation representing the inspection of a BOT building, using a EUROTL InspectionActivity Object
Super-properties |[prov:hadActivity](http://www.w3.org/ns/prov#hadActivity)<br />
Domain(s) |[bot:Building](https://w3id.org/bot#Building) (c)<br />
Range(s) |[eurotl:InspectionActivity](http://www.roadotl.eu/def/InspectionActivity) (c)<br />
[](Theconditionofanelementregardinganinspectionactivity)
### The condition of an element regarding an inspection activity
Property | Value
--- | ---
IRI | `http://icdd.vm.rub.de/ontology/amsicdd#hasCondition`
Super-properties |[eurotl:hasCondition](http://www.roadotl.eu/def/hasCondition)<br />
Domain(s) |[bot:Element](https://w3id.org/bot#Element) (c)<br />
Range(s) |[eurotl:Condition](http://www.roadotl.eu/def/Condition) (c)<br />

## Named Individuals
## Namespaces
* **amsicdd**
  * `http://icdd.vm.rub.de/ontology/amsicdd#`
* **asbing**
  * `http://asbing.de/condition/def/`
* **bot**
  * `https://w3id.org/bot#`
* **dcterms**
  * `http://purl.org/dc/terms/`
* **eurotl**
  * `http://www.roadotl.eu/def/`
* **owl**
  * `http://www.w3.org/2002/07/owl#`
* **prov**
  * `http://www.w3.org/ns/prov#`
* **rdf**
  * `http://www.w3.org/1999/02/22-rdf-syntax-ns#`
* **rdfs**
  * `http://www.w3.org/2000/01/rdf-schema#`
* **sdo**
  * `https://schema.org/`
* **skos**
  * `http://www.w3.org/2004/02/skos/core#`
* **vann**
  * `http://purl.org/vocab/vann/`
* **xml**
  * `http://www.w3.org/XML/1998/namespace`
* **xsd**
  * `http://www.w3.org/2001/XMLSchema#`

## Legend
* Classes: c
* Object Properties: op
* Functional Properties: fp
* Data Properties: dp
* Annotation Properties: dp
* Properties: p
* Named Individuals: ni