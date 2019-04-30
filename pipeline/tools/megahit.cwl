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
    dockerPull: quay.io/biocontainers/megahit:1.1.3--py35_0
label: MEGAHIT 1.1.3
baseCommand: megahit
arguments:
  - position: 1
    prefix: '-t'
    valueFrom: '$(runtime.cores)'
  - position: 2
    prefix: '--out-prefix'
    valueFrom: 'megahit'
  - position: 2
    prefix: '--min-count'
    valueFrom: '1'
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
  minContigLength:
    type: int?
    default: 200
    inputBinding:
      position: 6
      prefix: '--min-contig-len'
  kStep:
    type: int?
    default: 12
    inputBinding:
      position: 7
      prefix: '--k-step'
outputs:
  assembly:
    type: File
    outputBinding:
      glob: megahit_out/megahit.contigs.fa
  log:
    type: File
    outputBinding:
      glob: megahit_out/megahit.log