#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "Viral contig annotation"

hints:
 DockerRequirement:
   dockerFile: Dockerfile

baseCommand: "viral_contigs_annotation.py"
arguments: ["-o", $(runtime.outdir)]

inputs:
  input_fasta:
    type: File?
    format: edam:format_1929  # FASTA
    inputBinding:
      separate: true
      prefix: "-p"
  input_table:
    type: File
    format: edam:format_3475
    inputBinding:
      separate: true
      prefix: "-t"

outputs:
  annotation_table:
    type: File
    format: edam:format_3475
    outputBinding:
      glob: "*_prot_ann_table.tsv"

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