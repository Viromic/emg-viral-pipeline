#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Convert the assing taxonomy table

baseCommand: ["generate_counts_table.py"]

requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}

inputs:
  assign_table:
    type: File
    format: edam:format_3475
    label: Tab-delimited text file
    inputBinding:
      prefix: "-f"

arguments:
  - "-o"
  - $( inputs.assign_table.nameroot + "_tax_counts.tsv" )

outputs:
  count_table:
    type: File
    format: edam:format_3475    
    outputBinding:
      glob: "*_tax_counts.tsv"

$namespaces:
 s: http://schema.org/
 edam: http://edamontology.org/
$schemas:
 - https://schema.org/docs/schema_org_rdfa.html

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"