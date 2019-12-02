echo "Running the input preparation for the turbulent simulation"
n=1
for Re in 10000 50000 100000 500000 1000000 
do 						#get into for loop for Re equals each term
m=1
for xMesh in 512 1024      
do
o=1                                             #for each for loop xMesh equals the values do o=1
for yMesh in 128 256
do						#another for loop inside the other 2 loops to 						create a file named simulation with the following numbers.
mkdir Roy${n}_${m}_${o}
echo "created a file named Roy${n}_${m}_${o}"
cd originalF
sed -e "s/rrrrrrr/${Re}/" -e "s/xxxx/${xMesh}/" -e "s/yyy/${yMesh}/" inputOrig > input.dat
cp input.dat ../Roy${n}_${m}_${o}	#copy the data into the folder created
cd ../
o=$(( $o + 1 ))
done
m=$(( $m + 1 ))
done
n=$(( $n + 1 ))
done
echo "input file preparation is done" 	#increment the numbers used in file naming to increase the file numbering. in each Re there will be 4 files(2 in xMesh and 2 in yMech). and 5 big loops.
