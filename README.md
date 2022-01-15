Quick Start
===============================================================================
`master` is for my primary box (MacBook Pro). Other branches are for other
boxen.

Main docs in `master` branch


# sHPC START

`ssh` seems to log in to any locations: RKA, RID, SC1

But, can specify location by using explicit ssh command.

Use `hpcportal` as starting point

# Apps

App set via "RoCs". Load with

	source /apps/rocs/init.sh
	
Latest python or R:

	module load Python/3.8.2-GCCcore-9.3.0
    module load scikit-build/0.11.1-foss-2020a-Anaconda3-2021.05
    module load SciPy-bundle/2020.03-foss-2020a-Python-3.8.2 # for numpy/pandas/sklearn
	
	R-bundle-Bioconductor/3.12-foss-2020a-R-4.0.5
	R-Roche-bundle/2021.05-foss-2020a-R-4.0.5
	R/4.0.5-foss-2020a
	
# Python

Virtualenv

  * loads with python - see above
  * `virtualenv` command
  * Docs: [virtualenv.pypa.io/en/latest/index.html](https://virtualenv.pypa.io/en/latest/index.html)

virtualenvwrapper - NOT USING FOR NOW

  <!-- * I installed this after loading rocs. See below and `.profile_local` -->

scikit learn sklearn

	module load scikit-build/0.11.1-foss-2020a-Anaconda3-2021.05

### Jupyter environments

I loaded module `scikit-build-*` then registered it on command line. It should
be available in jupyter.

Docs: [hpcportal.roche.com/help/562103546](http://hpcportal.roche.com/help/562103546)

### Pip and python PATH

I load Rocs. Then, I use `pip install` (`which -a pip`)

It automatically install to user:

> Defaulting to user installation because normal site-packages is not writeable 	

But:

> WARNING: The script virtualenv-clone is installed in
> '$HOME/.local/bin' which is not on PATH.

So, I **added to path** in `.profile_local`:

	export PATH="$HOME/.local/bin:$PATH"


# Interactive jobs

To open an interactive shell with `2` cpus:

	bsub -Is -n 2 /bin/bash

Check or kill jobs:
	
	bjobs
	bkill <jobid>
	
For GPUs and more, see docs:
[hpcportal.roche.com/help/509049191](http://hpcportal.roche.com/help/509049191
