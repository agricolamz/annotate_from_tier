# This is a Praat script that creates new tier and fill it with information from other tier (each sound separatly).

# This script is distributed under the GNU General Public License.
# George Moroz 31.10.2017

form Open all files in directory
  comment Which tier is the utterance tier?
  integer uttier 6
  comment Which tier is the contence tier?
  integer contier 5
endformx

uttier  = uttier + 1
grid = selected ("TextGrid", 1)
selectObject: grid
Duplicate tier: contier, 1, "source"
Duplicate tier: uttier, 1, "sounds"

n_annotation_2 = Get number of intervals: 2
Replace interval text: 2, 0, n_annotation_2, "p:", "1", "Literals"
Replace interval text: 2, 0, n_annotation_2, "p':", "3", "Literals"
Replace interval text: 2, 0, n_annotation_2, "p'", "2", "Literals"
Replace interval text: 2, 0, n_annotation_2, "t:", "4", "Literals"
Replace interval text: 2, 0, n_annotation_2, "t':", "5", "Literals"
Replace interval text: 2, 0, n_annotation_2, "t'", "6", "Literals"
Replace interval text: 2, 0, n_annotation_2, "ts:", "7", "Literals"
Replace interval text: 2, 0, n_annotation_2, "ts':", "8", "Literals"
Replace interval text: 2, 0, n_annotation_2, "ts'", "9", "Literals"
Replace interval text: 2, 0, n_annotation_2, "ts", "0", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tʃ:", "-", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tʃ':", "=", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tʃ'", "`", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tʃ", "~", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tɬ'", "!", "Literals"
Replace interval text: 2, 0, n_annotation_2, "tɬ", ";", "Literals"
Replace interval text: 2, 0, n_annotation_2, "dz", "#", "Literals"
Replace interval text: 2, 0, n_annotation_2, "dʒ", "$", "Literals"
Replace interval text: 2, 0, n_annotation_2, "k:", "%", "Literals"
Replace interval text: 2, 0, n_annotation_2, "k':", "^", "Literals"
Replace interval text: 2, 0, n_annotation_2, "k'", "&", "Literals"
Replace interval text: 2, 0, n_annotation_2, "gʲ", "*", "Literals"
Replace interval text: 2, 0, n_annotation_2, "gʷ", "(", "Literals"
Replace interval text: 2, 0, n_annotation_2, "qχ'", ")", "Literals"
Replace interval text: 2, 0, n_annotation_2, "qχ", "_", "Literals"
Replace interval text: 2, 0, n_annotation_2, "qˤ", "+", "Literals"
Replace interval text: 2, 0, n_annotation_2, "q’ˤ", "[", "Literals"
Replace interval text: 2, 0, n_annotation_2, "q'ʷˤ", "{", "Literals"
Replace interval text: 2, 0, n_annotation_2, "q'", "]", "Literals"
Replace interval text: 2, 0, n_annotation_2, "ɢˤ", "}", "Literals"
Replace interval text: 2, 0, n_annotation_2, "kw", "<", "Literals"
Replace interval text: 2, 0, n_annotation_2, "n:", ">", "Literals"

uttier = uttier+1
n_annotation = Get number of intervals: uttier
for i from 1 to n_annotation
	start = Get starting point: uttier, i
	end = Get end point: uttier, i
	label_n = Get interval at time: 2, start
	label$ = Get label of interval: 2, label_n
	int_n = Get interval at time: 1, start
	ut_label$ = Get label of interval: 1, int_n
	if ut_label$ != ""
		Set interval text: 1, int_n, ""
		l = length (label$)
		for j from 1 to l
			b$ = mid$ (label$, j, 1)
			boundary_time = start + (end-start)/l*j
			if boundary_time < end
				Insert boundary: 1, boundary_time
				int_n_l = Get interval at time: 1, boundary_time
				Set interval text: 1, (int_n_l-1), b$
			else
				int_n = Get interval at time: 1, boundary_time
				Set interval text: 1, (int_n_l), b$
			endif
		endfor
	endif
endfor

Remove tier: 2
n_annotation_3 = Get number of intervals: 1
Replace interval text: 1, 0, n_annotation_3, ">", "n:", "Literals"
Replace interval text: 1, 0, n_annotation_3, "<", "kw", "Literals"
Replace interval text: 1, 0, n_annotation_3, "}", "ɢˤ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "]", "q'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "{", "q'ʷˤ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "[", "q’ˤ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "+", "qˤ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "_", "qχ", "Literals"
Replace interval text: 1, 0, n_annotation_3, ")", "qχ'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "(", "gʷ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "*", "gʲ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "&", "k'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "^", "k':", "Literals"
Replace interval text: 1, 0, n_annotation_3, "%", "k:", "Literals"
Replace interval text: 1, 0, n_annotation_3, "$", "dʒ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "#", "dz", "Literals"
Replace interval text: 1, 0, n_annotation_3, ";", "tɬ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "!", "tɬ'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "~", "tʃ", "Literals"
Replace interval text: 1, 0, n_annotation_3, "`", "tʃ'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "=", "tʃ':", "Literals"
Replace interval text: 1, 0, n_annotation_3, "-", "tʃ:", "Literals"
Replace interval text: 1, 0, n_annotation_3, "0", "ts", "Literals"
Replace interval text: 1, 0, n_annotation_3, "9", "ts'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "8", "ts':", "Literals"
Replace interval text: 1, 0, n_annotation_3, "7", "ts:", "Literals"
Replace interval text: 1, 0, n_annotation_3, "6", "t'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "5", "t':", "Literals"
Replace interval text: 1, 0, n_annotation_3, "4", "t:", "Literals"
Replace interval text: 1, 0, n_annotation_3, "2", "p'", "Literals"
Replace interval text: 1, 0, n_annotation_3, "3", "p':", "Literals"
Replace interval text: 1, 0, n_annotation_3, "1",  "p:", "Literals"
