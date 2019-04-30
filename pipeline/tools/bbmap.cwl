cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: ResourceRequirement
    coresMin: 56
    ramMin: 24000
    tmpdirMin: 4096
hints:
  DockerRequirement:
    dockerPull: virusx/bbmap:36.84--0
label: BBMap 36.84
baseCommand: bbmap.sh
arguments:
  - "-Xmx$(runtime.ram)M"
  - "nodisk=t"
  - "out=stdout.sam"
  - "statsfile=bbmap$(inputs.outFileSuffix).stats"
  - "covstats=bbmap$(inputs.outFileSuffix).covstats"
  - "rpkm=bbmap$(inputs.outFileSuffix).rpkm"
inputs:
  forward:
    type: File
    inputBinding:
      position: 1
      prefix: 'in='
      separate: false
  reverse:
    type: File?
    inputBinding:
      position: 2
      prefix: 'in2='
      separate: false
  reference:
    type: File
    inputBinding:
      position: 3
      prefix: 'ref='
      separate: false
  outFileSuffix:
    type: string
outputs:
  stdout:
    type: stdout
  stats:
    type: File
    outputBinding:
      glob: "bbmap$(inputs.outFileSuffix).stats"
  covstats:
    type: File
    outputBinding:
      glob: "bbmap$(inputs.outFileSuffix).covstats"
  rpkm:
    type: File
    outputBinding:
      glob: "bbmap$(inputs.outFileSuffix).rpkm"

stdout: bbmap.stdout