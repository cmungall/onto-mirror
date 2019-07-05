OBO = http://purl.obolibrary.org/obo

DIRS =  \
disease-normalizer \
uberon\
MSO\
cell-ontology\
go-ontology\
envo \
human-phenotype-ontology \
envo \
pato \
unipathway \
obo-relations \
BFO\
CVDO\
ChEBI\
DIDEO\
DINTO\
DUO\
EuPath-ontology\
GENO-ontology\
HumanDiseaseOntology\
IAO\
ICO \
MPIO\
MRO\
NCRO-Ontology-Files\
OMP-ontology\
OOSTT\
OPL\
Ontoneo\
PDRO\
PPO\
PathogenTransmissionOntology\
SEPIO-ontology\
SO-Ontologies\
SymptomOntology\
VO\
Wao\
agro/\
ancestro\
aro\
bcgo\
bco\
behavior-ontology\
bio-attribute-ontology\
biobanking\
biological-spatial-ontology\
caro\
cell-ontology\
cephalopod-ontology\
confidence-information-ontology\
contributor-role-ontology\
ctenophore-ontology\
ecocore\
emotion-ontology\
envo/\
evidenceontology\
feedontology\
flopoontology\
foodon/\
fungal-anatomy-ontology\
fypo\
genepio/\
go-ontology/\
homology-ontology\
human-developmental-anatomy-ontology\
human-phenotype-ontology/\
infectious-disease-ontology\
ino\
mammalian-phenotype-ontology\
mental-functioning-ontology\
miapa\
microbial-conditions-ontology\
migration-data\
mondo\
mouse-anatomy-ontology\
mpath\
ncbitaxon\
nomen\
oarcs\
obcs\
obo-relations\
obi\
ogms\
ohmi\
omiabis-dev\
opmi \
pato\
pco\
phipo\
planaria-ontology\
planarian-phenotype-ontology\
plant-environment-ontology\
plant-experimental-conditions-ontology\
plant-ontology\
plant-trait-ontology\
porifera-ontology\
rsc-cmo\
sibo\
spider-ontology\
stato\
taxrank\
teleost-taxonomy-ontology\
thesaurus-obo-edition\
uberon\
unit-ontology\
vertebrate-taxonomy-ontology\
xao\
xenopus-phenotype-ontology\
zebrafish-anatomical-ontology\
zebrafish-experimental-conditions-ontology\
zebrafish-phenotype-ontology\
gaz



# HISTORIC: DO NOT USE
all: symlinks

update_all: $(patsubst %, symlink-%, $(DIRS))

# DANGEROUS:
update-%:
	cd ../$* && git pull

# HISTORIC: DO NOT USE
symlinks: $(patsubst %, symlink-%, $(DIRS))

unsymlinks: $(patsubst %, unsymlink-%, $(DIRS))

symlink-%:
	test -d $* || ln -s ../$* $*

unsymlink-%:
	test -d $* && rm $*

all_download: dn-chebi

dn-%:
	mkdir -p $*
	curl -L -s $(OBO)/$*.owl > $*/$*.owl.tmp && mv $*/$*.owl.tmp $*/$*.owl

