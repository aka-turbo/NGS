## fastp Code Example

fastp -i ${reads[0]} -o ${sample_id}_1.fq.gz -I ${reads[1]} -O ${sample_id}_2.fq.gz -w 8 -z 5 -j ${sample_id}.json -h ${sample_id}.html 

## fastqc Code Example

mkdir fastqc_${sample_id}_logs_before

fastqc -t $task.cpus -o fastqc_${sample_id}_logs_before -f fastq -q ${reads}

## Kraken2 Code Example

kraken2 --memory-mapping --db /dev/shm/k2_pluspfp_20210127/ --threads 32 --output ${sample_id}.output --report ${sample_id}.report --paired ${reads}

## Unicycler Code Example

unicycler -1 ${reads[0]} -2 ${reads[1]} -o ${sample_id} -t 45

quast ${fasta_files} -o ${sample_id} -t 23

## AMR Code Example

amrfinder --nucleotide ${fasta_files} --threads 23 -o ${sample_id}.txt

abricate --db card ${fasta_files} > ${sample_id}.tab

## CGView Code Example

docker run --rm -v "$(pwd)":/dir -u "$(id -u)":"$(id -g)" -w /dir pstothard/cgview perl /usr/bin/cgview_xml_builder.pl -sequence prokka_multicontig.gbk -gc_content T -gc_skew T -size large-v2 -tick_density 0.05 -draw_divider_rings T -custom showBorder=false title="Example map" titleFontSize="200" -output map.xml

docker run --rm -v "$(pwd)":/dir -u "$(id -u)":"$(id -g)" -w /dir pstothard/cgview java -jar /usr/bin/cgview.jar -i map.xml -o map.png


