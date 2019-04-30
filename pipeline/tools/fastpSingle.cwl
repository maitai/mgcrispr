cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 56
    coresMax: 56
    ramMin: 2048
    tmpdirMin: 4096
hints:
  DockerRequirement:
    dockerPull: virusx/fastp:0.19.5
label: fastp 0.19.5
baseCommand: fastp
arguments:
  - position: 2
    prefix: '-o'
    valueFrom: 'fastp_out.fastq.gz'
inputs:
  single:
    type: File
    inputBinding:
      position: 1
      prefix: '-i'
  minlen:
    type: int?
    inputBinding:
      position: 3
      prefix: '-l'
outputs:
  fastq:
    type: File
    outputBinding:
      glob: "fastp_out.fastq.gz"
  log:
    type: stdout

stdout: fastp.log
stderr: fastp.log