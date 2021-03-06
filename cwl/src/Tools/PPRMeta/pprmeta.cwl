#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "PPR-Meta"

baseCommand: ["pprmeta.sh"]

inputs:
  singularity_image:
    type: File
    label: pprmeta.simg
    inputBinding:
      prefix: "-i"
  fasta_file:
    type: File
    label: contigs
    format: edam:format_1929    
    inputBinding:
      prefix: "-f"

arguments:
  - "-o"
  - $(runtime.outdir)/$(inputs.fasta_file.nameroot)_pprmeta.csv

outputs:
  pprmeta_output:
    type: File
    format: edam:format_3752
    outputBinding:
      glob: "*.csv"

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/version/latest/schema.rdf

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder:
    - name: "EMBL - European Bioinformatics Institute"
    - url: "https://www.ebi.ac.uk/"