cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 56
    ramMin: 48000
    tmpdirMin: 8192
  - class: InlineJavascriptRequirement
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/spades:3.13.0--0
label: Spades 3.13.0
baseCommand: spades.py
arguments:
  - position: 1
    prefix: '-t'
    valueFrom: '$(runtime.cores)'
  - position: 2
    valueFrom: '--meta'
  - position: 6
    prefix: '-o'
    valueFrom: 'metaspades_out'
inputs:
  forward:
    type: File
    inputBinding:
      position: 3
      prefix: '-1'
  reverse:
    type: File
    inputBinding:
      position: 4
      prefix: '-2'
  kList:
    type: int[]?
    default: 'auto'
    inputBinding:
      itemSeparator: ','
      position: 5
      prefix: '-k'
outputs:
  assembly:
    type: File
    outputBinding:
      glob: metaspades_out/metaspades.contigs.fa
  log:
    type: File
    outputBinding:
      glob: metaspades_out/metaspades.log
