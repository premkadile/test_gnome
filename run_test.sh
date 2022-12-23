#!/bin/bash
#test indexing
echo
echo "Test1 -- Generate index files with a reference file"
echo "Command=bin/bwt_index test/ecoli.fa test/ecoli"
echo
bin/bwt_index test/ecoli.fa test/ecoli

#test alignment
echo "Test2 -- Align two E.coli strains with 4 threads"
echo "Command=bin/GATEkeeper -t 4 -i test/ecoli -q test/ecoli.mut -o test/ecoli_output"
echo
bin/GATEkeeper -t 4 -i test/ecoli -q test/ecoli.mut -o test/ecoli_output
echo
echo "[End of test]"
