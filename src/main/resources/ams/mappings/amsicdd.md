Markdown documentation created by [pyLODE](http://github.com/rdflib/pyLODE) 2.4

# Asset Condition Integration of BOT Elements amsicdd

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