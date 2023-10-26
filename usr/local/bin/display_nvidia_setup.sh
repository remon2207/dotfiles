#!/usr/bin/env bash

set -eu

nvidia-settings --assign "CurrentMetaMode=\
  DPY-6: 1920x1080_165 @1920x1080 +0+1080 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On,
  ForceFullCompositionPipeline=On}, DPY-0: 1920x1080_60 @1920x1080 +1920+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-3: 1920x1080_75 @1920x1080 +0+0
  {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DPY-4: 1920x1080_60 @1920x1080 +1920+1080 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On,
  ForceFullCompositionPipeline=On}" > /dev/null
