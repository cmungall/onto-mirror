
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