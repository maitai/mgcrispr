cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 4
    ramMin: 8192
    tmpdirMin: 2048
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.3.1--5
label: samtools 1.3.1
baseCommand: samtools
arguments:
  - "sort"
  - "-m"
  - "$(runtime.ram)M"
  - "-@"
  - "$(runtime.cores)"
  - "-o"
  - "out.sorted.sam"
inputs:
  inputFile:
    type: File
    streamable: true
outputs:
  samFile:
    type: File
    outputBinding:
      glob: "out.sorted.sam"

stdin: '$(inputs.inputFile.path)'