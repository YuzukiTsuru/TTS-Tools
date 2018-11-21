QuestionSetFilter
=================

A question set filter to simply the question set used in contextual clustering.

Intro
=====
Normally, when we use HTK/HTS to train models for speech recognition/synthesis, contextual clustering is necessary if a full context model is being trained. The question set is built from the lexicon and prosodic rules. When the question set was prepared for a large amount of data, it became quite large. However, not every question are valid node splitter. This script is used to filter the large question set with training data, so the clutering process would be quicker.

Usage
=====
perl qstfilter.pl cat.lab question.hed > question.filter.hed
     cat.lab       :  a catted file including all the full labels
     question.hed  :  a full question set file

Contact
=======
This script is for research. Should you have any problem, please contact
asr(dot)naxingyu(at)gmail(dot)com
