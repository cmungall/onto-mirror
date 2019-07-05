# onto-mirror

Local caching of ontologies to use with sparqlprog family of tools

# instructions

This assumes that you have ontologies checked out from github at the
same level as where you have this repo. E.g.

 * repos/
    * onto-mirror/
    * go-ontology
    * human-phenotype-ontology/

etc

Add to your `~/.profile`:

```
if [ -d $HOME/repos/onto-mirror/ ]; then
alias poq="pl2sparql -e -A $HOME/repos/onto-mirror/void.ttl -i"
fi
```

```
# query all label/2 (i.e. rdfs:label) in RO
poq ro label

# label match
poq uberon / lmatch limb _

# lexical search (see search_util)
poq uberon / lsearch limb _ -l
poq uberon / lsearch ^limb _ -l
poq uberon / lsearch limb$ _ -l

# viz
poq uberon / searchviz ^limb$
```


q command
```
poq uberon q ^limb$ l . s,part\ of viz
```
