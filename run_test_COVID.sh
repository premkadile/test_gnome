#!/bin/bash
#test indexing
echo
echo "Test1 -- Generate index files with a reference file"
echo "Command=bin/bwt_index COVID_Test/COVID19_CompleteGenome_NC_045512.fasta COVID_Test/COVID_NC045512"
echo
bin/bwt_index COVID_Test/COVID19_CompleteGenome_NC_045512.fasta COVID_Test/COVID_NC045512

#test alignment
echo "Test2 -- Align two COVID virus strains with 4 threads"
echo "Command=bin/GATEkeeper -t 4 -i COVID_Test/COVID_NC045512 -q COVID_Test/COVID19_CompleteGenome_NC_045512_ManuallyMutated.fasta -o COVID_Test/COVID_output"
echo
bin/GATEkeeper -t 4 -i COVID_Test/COVID_NC045512 -q COVID_Test/COVID19_CompleteGenome_NC_045512_ManuallyMutated.fasta -o COVID_Test/COVID_output
echo
echo "[End of test]"
