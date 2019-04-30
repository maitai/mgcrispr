cwlVersion: v1.0
class: Workflow
label: mgcrispr

inputs:
  fastqCellularR1: File
  fastqCellularR2: File
  fastqViralR1: File
  fastqViralR2: File
  trimHeadcrop:
    type: int?
    label: crop first bases
  trimCrop:
    type: int?
    label: crop to length
  trimLeading:
    type: int
    label: trim leading low quality bases
  trimTrailing:
    type: int
    label: trim trailing low quality bases
  trimSlidingwindow:
    type: string
    label: trim using sliding window
  trimMinlen:
    type: int
    label: miminum length of trimmed read
  trimIlluminaclip: string
  trimIlluminaclip2: string?
  trimIlluminaclip3: string?


steps:
  trimViral:
    label: 'trim raw reads'
    run: tools/trimmomatic.cwl
    in:
      forward: fastqViralR1
      reverse: fastqViralR2
      headcrop: trimHeadcrop
      crop: trimCrop
      leading: trimLeading
      trailing: trimTrailing
      slidingwindow: trimSlidingwindow
      minlen: trimMinlen
      illuminaclip: trimIlluminaclip
      illuminaclip2: trimIlluminaclip2
      illuminaclip3: trimIlluminaclip3
    out:
      - forwardPaired
      - reversePaired
      - forwardUnpaired
      - reverseUnpaired
      - log


outputs:
  trimViralR1:
    type: File
    outputSource: trimViral/forwardPaired
  trimViralR2:
    type: File
    outputSource: trimViral/reversePaired