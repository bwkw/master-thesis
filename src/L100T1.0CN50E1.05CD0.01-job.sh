#!/bin/sh

#SBATCH -p F144cpu
#SBATCH -N 144
#SBATCH -n 18432
#SBATCH --mail-type=ALL
#SBATCH --mail-user={{メールアドレス}}

source /home/issp/materiapps/intel/lammps/lammpsvars.sh

srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan13909-lbn681530-lcn7025-ran389-rbn19066-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan27818-lbn667621-lcn7025-ran778-rbn18677-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan41726-lbn653713-lcn7025-ran1167-rbn18288-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan55635-lbn639804-lcn7025-ran1556-rbn17899-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan69544-lbn625895-lcn7025-ran1946-rbn17509-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan83453-lbn611986-lcn7025-ran2335-rbn17120-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan97361-lbn598078-lcn7025-ran2724-rbn16731-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan111270-lbn584169-lcn7025-ran3113-rbn16342-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan125179-lbn570260-lcn7025-ran3502-rbn15953-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan139088-lbn556351-lcn7025-ran3891-rbn15564-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan152997-lbn542442-lcn7025-ran4280-rbn15175-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan166905-lbn528534-lcn7025-ran4669-rbn14786-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan180814-lbn514625-lcn7025-ran5058-rbn14397-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan194723-lbn500716-lcn7025-ran5447-rbn14008-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan208632-lbn486807-lcn7025-ran5836-rbn13619-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan222540-lbn472899-lcn7025-ran6226-rbn13229-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan236449-lbn458990-lcn7025-ran6615-rbn12840-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan250358-lbn445081-lcn7025-ran7004-rbn12451-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan264267-lbn431172-lcn7025-ran7393-rbn12062-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan292084-lbn403355-lcn7025-ran8171-rbn11284-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan305993-lbn389446-lcn7025-ran8560-rbn10895-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan319902-lbn375537-lcn7025-ran8949-rbn10506-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan333811-lbn361628-lcn7025-ran9338-rbn10117-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan347720-lbn347719-lcn7025-ran9728-rbn9727-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan361628-lbn333811-lcn7025-ran10117-rbn9338-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan375537-lbn319902-lcn7025-ran10506-rbn8949-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan389446-lbn305993-lcn7025-ran10895-rbn8560-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan403355-lbn292084-lcn7025-ran11284-rbn8171-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan417263-lbn278176-lcn7025-ran11673-rbn7782-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan431172-lbn264267-lcn7025-ran12062-rbn7393-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan445081-lbn250358-lcn7025-ran12451-rbn7004-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan458990-lbn236449-lcn7025-ran12840-rbn6615-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan472899-lbn222540-lcn7025-ran13229-rbn6226-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan486807-lbn208632-lcn7025-ran13618-rbn5837-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan500716-lbn194723-lcn7025-ran14008-rbn5447-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan514625-lbn180814-lcn7025-ran14397-rbn5058-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan528534-lbn166905-lcn7025-ran14786-rbn4669-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan542442-lbn152997-lcn7025-ran15175-rbn4280-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan556351-lbn139088-lcn7025-ran15564-rbn3891-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan570260-lbn125179-lcn7025-ran15953-rbn3502-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan584169-lbn111270-lcn7025-ran16342-rbn3113-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan598078-lbn97361-lcn7025-ran16731-rbn2724-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan611986-lbn83453-lcn7025-ran17120-rbn2335-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan625895-lbn69544-lcn7025-ran17510-rbn1945-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan639804-lbn55635-lcn7025-ran17899-rbn1556-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan653713-lbn41726-lcn7025-ran18288-rbn1167-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan667621-lbn27818-lcn7025-ran18677-rbn778-rcn197.in &
srun --exclusive --mem-per-cpu=1840 -n 256 -c 1 -N 2 lammps < data/in.melt/
L100T1.0E1.05CD0.01/lan681530-lbn13909-lcn7025-ran19066-rbn389-rcn197.in &
wait
