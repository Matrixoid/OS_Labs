#!/bin/bash

grep -e "\\(WW\\) /var/log/anaconda/X.log | sed -e "s/\\(WW\\)/Warning: /" > full.log
grep -e "\\(II\\) /var/log/anaconda/X.log | sed -e "s/\\(II\\)/Information: /" >> full.log
