# deepaffinity_app
## Parameters
> - ### running_mode
>
>> enter a number in \[1,2,3\]
>> - mode 1: protein-compound pairs prediction (ready)
>> - mode 2: compound screening for human proteins (ready for compound library: drug-rep-hub)
>> - mode 3: human protein screening for compounds (ready)

> - ### model_version
> 
>> enter one number in \[1,2,3\]
>> - version 1: DeepAffinity Bioinf 2019 (ready)
>> - version 2: DeepAffinity JCIM 2021 (not ready)
>> - version 3: DeepAffinity+ (not ready)

> - ### inputs
> 
>> protein, compound inputs
>> - mode 1: enter human protein uniprot entry name (without '\_HUMAN') and compound smile sequence pair (delimited by ','). Pairs are delimited by semicolon ';'
>> - mode 2: enter human protein uniprot entry name (without '\_HUMAN'). Proteins delimited by semicolon ';'
>> - mode 3: enter compound smile sequence, delimited by semicolon ';'

> - ### output_file
> 
>> name of output file, default: prediction.txt

> - ### label_to_predict
> 
>> enter one label type to predict in \[ic50, ki, kd\] (ic50 ready)

> - ### compound_library
>
>> choose a compound library to screen \[[drug-rep-hub](https://clue.io/repurposing#home), [stitch](http://stitch.embl.de/), [zinc](https://zinc.docking.org/), [pubchem](https://pubchem.ncbi.nlm.nih.gov/)\] (drug-rep-hub ready)

#### Job details
> - Allocation
>> select 'CACTI'
